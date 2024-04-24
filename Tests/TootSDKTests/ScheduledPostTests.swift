// Created by konstantin on 04/12/2022.
// Copyright (c) 2022. All rights reserved.

import XCTest

@testable import TootSDK

final class ScheduledPostTests: XCTestCase {

    func testDecodesSensitiveAsBoolean() throws {
        // arrange
        let json = localContent("scheduled_post_sensitive")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(ScheduledPost.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertEqual(result.id, "1023")
        XCTAssertNotNil(result.scheduledAt)
        XCTAssertNotNil(result.params)
        XCTAssertNil(result.params.inReplyToId)
        XCTAssertNil(result.params.inReplyToConversationId)
        XCTAssertEqual(result.params.sensitive, true)
        XCTAssertEqual(result.params.text, "Test")
        XCTAssertNil(result.params.scheduledAt)
        XCTAssertNil(result.params.mediaIds)
        XCTAssertNil(result.params.poll)
        XCTAssertNil(result.params.idempotency)
        XCTAssertEqual(result.params.spoilerText, "Warn")
        XCTAssertEqual(result.params.language, "en")
        XCTAssertEqual(result.params.visibility, .direct)
    }

    func testScheduledPostMediaIds() throws {
        // arrange
        let json = localContent("scheduled_post_attachment")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(ScheduledPost.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertEqual(result.id, "1031")
        XCTAssertNotNil(result.scheduledAt)
        XCTAssertNotNil(result.params)
        XCTAssertNil(result.params.inReplyToId)
        XCTAssertNil(result.params.inReplyToConversationId)
        XCTAssertNil(result.params.sensitive)
        XCTAssertEqual(result.params.text, "Testing scheduled attachment")
        XCTAssertNil(result.params.scheduledAt)
        XCTAssertNotNil(result.params.mediaIds)
        XCTAssertNil(result.params.poll)
        XCTAssertNil(result.params.idempotency)
        XCTAssertNil(result.params.spoilerText)
        XCTAssertEqual(result.params.language, "en")
        XCTAssertEqual(result.params.visibility, .private)
    }

    func testScheduledPostMultipleMedias() throws {
        // arrange
        let json = localContent("scheduled_post_multiple_attachments")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(ScheduledPost.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertEqual(result.id, "104394")
        XCTAssertNotNil(result.scheduledAt)
        XCTAssertNotNil(result.params)
        XCTAssertNil(result.params.inReplyToId)
        XCTAssertNil(result.params.inReplyToConversationId)
        XCTAssertNil(result.params.sensitive)
        XCTAssertEqual(result.params.text, "Testing scheduled attachments")
        XCTAssertNil(result.params.scheduledAt)
        XCTAssertNotNil(result.params.mediaIds)
        XCTAssertNil(result.params.poll)
        XCTAssertNil(result.params.idempotency)
        XCTAssertNil(result.params.spoilerText)
        XCTAssertEqual(result.params.language, "en")
        XCTAssertEqual(result.params.visibility, .private)
        XCTAssertEqual(result.params.mediaIds, ["111892073708535727", "111892073823106369"])
        XCTAssertEqual(result.params.mediaIds, result.mediaAttachments.map(\.id))
    }

    func testScheduledPostReplyIds() throws {
        // arrange
        let json = localContent("scheduled_post_reply")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(ScheduledPost.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertEqual(result.id, "1032")
        XCTAssertNotNil(result.scheduledAt)
        XCTAssertNotNil(result.params)
        XCTAssertEqual(result.params.inReplyToId, "110883505948339014")
        XCTAssertNil(result.params.inReplyToConversationId)
        XCTAssertNil(result.params.sensitive)
        XCTAssertEqual(result.params.text, "@technicat testing scheduled reply")
        XCTAssertNil(result.params.scheduledAt)
        XCTAssertNil(result.params.mediaIds)
        XCTAssertNil(result.params.poll)
        XCTAssertNil(result.params.idempotency)
        XCTAssertNil(result.params.spoilerText)
        XCTAssertEqual(result.params.language, "en")
        XCTAssertEqual(result.params.visibility, .unlisted)
    }
}
