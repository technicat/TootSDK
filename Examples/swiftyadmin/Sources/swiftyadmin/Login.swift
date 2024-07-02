// Created by konstantin on 17/12/2022.
// Copyright (c) 2022. All rights reserved.

import ArgumentParser
import Foundation
import TootSDK

struct Login: AsyncParsableCommand {

    @Option(name: .short, help: "URL to the instance to connect to")
    var url: String

    @Option(
        name: .short,
        help:
            "List of scopes to request during authentication. e.g. '-s admin:read -s admin:write'"
    )
    var scopes: [OAuthScope] = [.read, .write, .follow, .push]

    mutating func run() async throws {
        guard let serverUrl = URL(string: url) else {
            print("Invalid url")
            return
        }

        print("Logging into (serverUrl.absoluteString) with scopes \(scopes.map{$0.rawValue}.joined(separator: ", "))")
        let callbackURI: String = "urn:ietf:wg:oauth:2.0:oob"
        let client = TootClient(instanceURL: serverUrl, scopes: scopes)

        let authUrl = try await client.createAuthorizeURL(
            server: serverUrl, callbackURI: callbackURI)

        guard let clientId = client.currentApplicationInfo?.clientId,
            let clientSecret = client.currentApplicationInfo?.clientSecret
        else {
            print("Did not receive client id and secret as expected")
            return
        }
        print("Client id: \(clientId)")
        print("Client secret: \(clientSecret)")
        print(
            "Please navigate to the following link to complete the authentication:\n\r\(authUrl.absoluteString)"
        )
        print("Paste the access code and hit Enter to continue:\n\r")
        guard let code = readLine() else {
            print("Access code is required to complete authorization.")
            return
        }
        let accessToken = try await client.collectToken(
            code: code, clientId: clientId, clientSecret: clientSecret, callbackURI: callbackURI)

        print("You can use the following access token as a bearer token: \(accessToken)")
    }
}
