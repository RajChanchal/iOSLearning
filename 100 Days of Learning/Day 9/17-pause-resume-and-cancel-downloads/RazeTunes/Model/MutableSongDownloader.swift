/// Copyright (c) 2025 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

class MutableSongDownloader: NSObject, ObservableObject {
  enum State {
    case puased
    case downloading
    case failed
    case finished
    case waiting
  }
  @Published var downloadLcoation: URL?
  @Published var downloadProgress: Float = 0.0
  var state: State = .waiting
  private var downloadURL: URL?
  private var downloadTask: URLSessionDownloadTask?
  private var resumeData: Data?
  private lazy var session: URLSession = {
    let configuration = URLSessionConfiguration.default
    return URLSession.init(configuration: configuration,
                           delegate: self,
                           delegateQueue: nil)
  }()
  
  func downloadSong(url: URL) {
    downloadURL = url
    downloadTask = session.downloadTask(with: url)
    downloadTask?.resume()
    state = .downloading
  }
}

extension MutableSongDownloader: URLSessionDownloadDelegate {
  func urlSession(_ session: URLSession,
                  downloadTask: URLSessionDownloadTask,
                  didFinishDownloadingTo location: URL) {
    let fileManager = FileManager.default
    guard let documentsDirectoryPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first,
          let lastPathComponent = downloadURL?.lastPathComponent else {
      Task {
        await MainActor.run {
          state = .failed
        }
      }
      return
    }
    let destinationPath = documentsDirectoryPath.appendingPathComponent(lastPathComponent)
    do {
      if fileManager.fileExists(atPath: destinationPath.path) {
        try fileManager.removeItem(at: destinationPath)
      }
      try fileManager.copyItem(at: location, to: destinationPath)
      Task {
        await MainActor.run {
          downloadLcoation = destinationPath
          state = .finished
        }
      }

    }catch {
      Task {
        await MainActor.run {
          state = .failed
        }
      }
    }
    
  }
  
  func cancel() {
    state = .waiting
    downloadTask?.cancel()
    Task {
      await MainActor.run {
        downloadProgress = 0
      }
    }
  }
  
  func pause() {
    
    downloadTask?.cancel { data in
      Task {
        await MainActor.run {
          self.state = .puased
          self.resumeData = data
          self.downloadProgress = self.downloadProgress
        }
      }
      
    }
  }
  
  func resume() {
    guard let resumeData else { return }
    downloadTask = session.downloadTask(withResumeData: resumeData)
    downloadTask?.resume()
    state = .downloading
    
  }
  func urlSession(_ session: URLSession,
                  downloadTask: URLSessionDownloadTask,
                  didWriteData bytesWritten: Int64,
                  totalBytesWritten: Int64,
                  totalBytesExpectedToWrite: Int64) {
    Task {
      await MainActor.run {
        downloadProgress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
      }
    }
  }
  
  func urlSession(_ session: URLSession,
                  task: URLSessionTask,
                  didCompleteWithError error: (any Error)?) {
    guard let response = task.response as? HTTPURLResponse, response.statusCode != 200 else { return }
    Task {
      await MainActor.run {
        state = .failed
      }
    }
  }
}
