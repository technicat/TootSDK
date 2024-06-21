//
//  GetMarkers.swift
//
//
//  Created by Łukasz Rutkowski on 02/12/2023.
//

import ArgumentParser
import Foundation
import TootSDK

struct GetMarkers: AsyncParsableCommand {

    @Option(name: .shortAndLong, help: "URL to the instance to connect to")
    var url: String

    @Option(name: .short, help: "Access token for an account with sufficient permissions.")
    var token: String

    @Option(
        name: .long, parsing: .remaining,
        transform: { rawValue in
            guard let timeline = MarkerTimeline(rawValue: rawValue) else {
                throw ValidationError("Unknown timeline")
            }
            return timeline
        })
    var timelines: [MarkerTimeline]

    mutating func run() async throws {
        let client = TootClient(instanceURL: URL(string: url)!, accessToken: token)
        client.debugOn()
        let markers = try await client.getMarkers(for: Set(timelines))
        print(markers)
    }
}
