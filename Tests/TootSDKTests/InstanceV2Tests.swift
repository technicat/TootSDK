import XCTest

@testable import TootSDK

final class InstanceV2Tests: XCTestCase {

    func testMastodon() throws {
        // arrange
        let json = localContent("instancev2_mastodon")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV2.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testPleroma() throws {
        // arrange
        let json = localContent("instancev2_pleroma")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV2.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

    func testUniverseodon() throws {
        // arrange
        let json = localContent("instancev2_universeodon")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(InstanceV2.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

}
