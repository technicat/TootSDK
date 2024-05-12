//import ArgumentParser
//import Foundation
//import TootSDK
//
//struct GetFlavour: AsyncParsableCommand {
//
//    @Option(name: .short, help: "URL to the instance to connect to")
//    var url: String
//
//    mutating func run() async throws {
//        let client = TootClient(instanceURL: URL(string: url)!)
//        print("Detected server flavour: \(client.flavour)")
//    }
//}
