import SwiftUI
import Foundation
let defaultConfiguraiton = URLSessionConfiguration.default
let session = URLSession(configuration: defaultConfiguraiton)

guard let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=starlight") else { fatalError() }

Task {
    let (data, response) = try await session.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode),
        let string = String(data: data, encoding: .utf8) else { return }
    print(string)
}

