//
//  RejectFollowRequest.swift
//
//
//  Created by Łukasz Rutkowski on 10/12/2023.
//

import ArgumentParser
import Foundation
import TootSDK

struct RejectFollowRequest: AsyncParsableCommand {
    @OptionGroup var auth: AuthOptions
    @Option var id: String

    mutating func run() async throws {
        let client = TootClient(instanceURL: auth.url, accessToken: auth.token)
        if auth.verbose {
            client.debugOn()
        }
        let relationship = try await client.rejectFollowRequest(id: id)
        print(relationship)
    }
}
