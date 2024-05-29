//
//  PostTests.swift
//
//
//  Created by Philip Chu on 5/28/24.
//

import XCTest

@testable import TootSDK

final class PostTests: XCTestCase {

    func testMitra() throws {
        // arrange
        let json = localContent("post_mitra")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(Post.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }
}
