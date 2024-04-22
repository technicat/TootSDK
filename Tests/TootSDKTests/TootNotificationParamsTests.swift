//
//  TootNotificationParamsTests.swift
//
//
//  Created by Łukasz Rutkowski on 05/01/2024.
//

import XCTest

@testable import TootSDK

final class TootNotificationParamsTests: XCTestCase {

    func testPleromaAkkomaQueryParams() throws {
        for flavour in [TootSDKFlavour.pleroma, .akkoma] {
            let client = TootClient(instanceURL: URL(string: "https://mastodon.social")!)
            client.flavour = flavour

            let params = TootNotificationParams(excludeTypes: [.mention], types: [.favourite])
            let query = client.createQuery(from: params).sorted { ($0.name, $0.value ?? "") < ($1.name, $1.value ?? "") }
            XCTAssertEqual(
                query,
                [
                    URLQueryItem(name: "exclude_types[]", value: "mention"),
                    URLQueryItem(name: "include_types[]", value: "favourite"),
                ], "Incorrect params for \(flavour)")
        }
    }

    func testMastodonQueryParams() throws {
        let client = TootClient(instanceURL: URL(string: "https://mastodon.social")!)
        client.flavour = .mastodon

        let params = TootNotificationParams(excludeTypes: [.mention], types: [.favourite])
        let query = client.createQuery(from: params).sorted { ($0.name, $0.value ?? "") < ($1.name, $1.value ?? "") }
        XCTAssertEqual(
            query,
            [
                URLQueryItem(name: "exclude_types[]", value: "mention"),
                URLQueryItem(name: "types[]", value: "favourite"),
            ])
    }
}
