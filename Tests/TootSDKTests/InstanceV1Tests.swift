import XCTest

@testable import TootSDK

final class InstanceV1Tests: XCTestCase {
    func testFriendicaNoContact() throws {
        // arrange
        let json = localContent("instance_friendica_nocontact")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV1.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertNil(result.contactAccount)
        XCTAssertEqual(result.languages, [.fr])
        XCTAssertEqual(result.version, "2.8.0 (compatible; Friendica 2023.05)")
        XCTAssertEqual(result.uri, "social.thisworksonmycomputer.local")
        XCTAssertEqual(result.title, "Social")
        XCTAssertEqual(result.invitesEnabled, false)
        XCTAssertEqual(result.registrations, true)
    }

    func testSharkeyNoContact() throws {
        // arrange
        let json = localContent("instance_sharkey_contact_removed")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV1.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testIceshrimpNoContact() throws {
        // arrange
        let json = localContent("instance_iceshrimp_contact_removed")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV1.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testFirefishNoContact() throws {
        // arrange
        let json = localContent("instance_firefish_contact_removed")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV1.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testCatodonContact() throws {
        // arrange
        let json = localContent("instance_catodon_contact_removed")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV1.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testAkkoma() throws {
        // arrange
        let json = localContent("instance_akkoma")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV1.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testMastodon() throws {
        // arrange
        let json = localContent("mastodon")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV1.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testPixelfed() throws {
        // arrange
        let json = localContent("pixelfed")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV1.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testPleroma() throws {
        // arrange
        let json = localContent("pleroma")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV1.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testMicrodotblog() throws {
        // arrange
        let json = localContent("instancev1_microdotblog")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV1.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }
}
