import XCTest

@testable import TootSDK

final class AccountTests: XCTestCase {
    func testDecoding() throws {
        // arrange
        let json = localContent("account")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(Account.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertEqual(result.id, "23634")
    }

    func testDecodingIndirectOptional() throws {
        // arrange
        let json = localContent("account_moved")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(Account.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertNotNil(result.moved)
        XCTAssertEqual(result.moved?.id, "23634")
    }

    func testEncoding() throws {
        // arrange
        let json = localContent("account")
        let decoder = TootDecoder()
        let encoder = TootEncoder()
        let model = try decoder.decode(Account.self, from: json)

        // act
        let encodedData = try encoder.encode(model)
        let encodedModel = try decoder.decode(Account.self, from: encodedData)

        // assert
        XCTAssertNotNil(encodedModel)
        XCTAssertEqual(encodedModel, model)
        //        XCTAssertEqual(encodedData.hashValue, model.hashValue)
    }

    func testAkkoma() throws {
        // arrange
        let json = localContent("account_akkoma_miraiverse")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(Account.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertNotNil(result.pleroma)
        XCTAssertNotNil(result.akkoma)
    }

    func testDecodingMastodonOfficialAccount() throws {
        // arrange
        let json = localContent("account_mastodon_official")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(Account.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertEqual(result.id, "13179")
        XCTAssertEqual(result.noindex, false)
        XCTAssertEqual(result.indexable, false)
        XCTAssertEqual(result.locked, false)
        XCTAssertEqual(result.bot, false)
        XCTAssertEqual(result.group, false)
        XCTAssertEqual(result.discoverable, true)
        XCTAssertEqual(result.hideCollections, false)
        XCTAssertEqual(result.username, "Mastodon")
        XCTAssertEqual(result.displayName, "Mastodon")
        XCTAssertEqual(result.followersCount, 814295)
        XCTAssertEqual(result.followingCount, 3)
        XCTAssertEqual(result.url, "https://mastodon.social/@Mastodon")
        XCTAssertNotNil(result.emojis)
    }

    func testDecodingPixelfed() throws {
        // arrange
        let json = localContent("account_pixelfed")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(Account.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertEqual(result.id, "569707951076919035")
    }

    func testDecodingPixelfedAccountInMutesOrBlocksList() throws {
        // arrange
        let json = localContent("account_pixelfed_mutes_blocks")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(Account.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertEqual(result.id, "650577272541390361")
    }
}
