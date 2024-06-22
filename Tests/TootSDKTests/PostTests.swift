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

    func testPleroma() throws {
        // arrange
        let json = localContent("post_pleroma")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(Post.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testAttachments() throws {
        // arrange
        let json = localContent("post_attachments")
        let decoder = TootDecoder()

        // act
        let post = try decoder.decode(Post.self, from: json)

        // assert
        XCTAssertNotNil(post)
        XCTAssert(post.mediaAttachments.count > 0)
    }
}
