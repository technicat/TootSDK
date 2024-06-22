import XCTest

@testable import TootSDK

final class CredentialAccountTests: XCTestCase {
   
    func testCondensed() throws {
        // arrange
        let json = localContent("credential_account_condensed")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(CredentialAccount.self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertNotNil(result.source)
        XCTAssertEqual(result.source?.fields[0].name, "Person LLC")
        XCTAssertEqual(result.source?.fields[0].value, "https://example.com/")
        XCTAssertNotNil(result.source?.fields[0].verifiedAt)
        XCTAssertEqual(result.source?.sensitive, false)
        XCTAssertEqual(result.source?.note, "Lorem ipsum")
        XCTAssertEqual(result.source?.indexable, true)
        XCTAssertEqual(result.source?.privacy, .public)
        XCTAssertEqual(result.source?.hideCollections, true)
        XCTAssertEqual(result.source?.language, .en)
        XCTAssertEqual(result.source?.followRequestsCount, 0)
        XCTAssertEqual(result.source?.discoverable, true)
        XCTAssertNotNil(result.role)
        XCTAssertNotNil(result.role)
        XCTAssertEqual(result.role?.id, "-99")
        XCTAssertEqual(result.role?.permissions, "65536")
        XCTAssertEqual(result.role?.highlighted, false)
        XCTAssertEqual(result.role?.name, "")
        XCTAssertEqual(result.role?.color, "")
    }
    
    func testUniverseodon() throws {
        // arrange
        let json = localContent("credential_account_universeodon")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(CredentialAccount.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }
    
    func testMitra() throws {
        // arrange
        let json = localContent("credential_account_mitra")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(CredentialAccount.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }
    
    func testGotoSocial() throws {
        // arrange
        let json = localContent("credential_account_gotosocial")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(CredentialAccount.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }
    
    func testSharkey() throws {
        // arrange
        let json = localContent("credential_account_sharkey")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(CredentialAccount.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }
}
