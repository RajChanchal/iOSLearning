import UIKit

func extractTitle(from url: URL) async throws -> String? {
    for try await line in url.lines {
        if line.contains("<title>") {
            return line
        }
    }
    return nil
}

///Following task outputs:
///1    <title>Home - DAWN.COM</title>
///2    <title>Home - DAWN.COM</title>
///3    <title>Home - DAWN.COM</title>
///4    <title>Home - DAWN.COM</title>
///Golden
//Task {
//    //Sequential Calls
//    if let title = try await extractTitle(from: URL(string: "https://dawn.com")!) {
//        print("Task 1: 1"+title)
//    }
//    if let title = try await extractTitle(from: URL(string: "https://dawn.com")!) {
//        print("Task 1: 2"+title)
//    }
//    if let title = try await extractTitle(from: URL(string: "https://dawn.com")!) {
//        print("Task 1: 3"+title)
//    }
//    if let title = try await extractTitle(from: URL(string: "https://dawn.com")!) {
//        print("Task 1: 4"+title)
//    }
//    print("Task 1: Golden")
//}

Task {
    //Concurrent Calls
    async let a = extractTitle(from: URL(string: "https://dawn.com")!)
    async let b = extractTitle(from: URL(string: "https://dawn.com")!)
    async let c = extractTitle(from: URL(string: "https://dawn.com")!)
    async let d = extractTitle(from: URL(string: "https://dawn.com")!)
    
    let results = try await [a, b, c, d]
    print("Results: \(results.compactMap{$0})")
    print("Task 2: Golden")
}
