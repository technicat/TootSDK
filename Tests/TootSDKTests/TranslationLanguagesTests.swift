import XCTest

@testable import TootSDK

final class TranslationLanguagesTests: XCTestCase {

    /// translation is not enabled, no languages installed
    func testAkkomaEmpty() throws {
        // arrange
        let json = localContent("translation_languages_akkoma_empty")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(
            TranslationLanguagesAkkoma
                .self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertNil(result.source)
        XCTAssertNil(result.target)
    }

    /// sample from Akkoma doc
    func testAkkomaDoc() throws {
        // arrange
        let json = localContent("translation_languages_akkoma_doc")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(
            TranslationLanguagesAkkoma
                .self, from: json)

        // assert
        XCTAssertNotNil(result)
        XCTAssertNotNil(result.source)
        XCTAssertNotNil(result.target)
        XCTAssertEqual(result.source?[0].code, .lv)
        XCTAssertEqual(result.source?[0].name, "Latvian")
        XCTAssertEqual(result.source?[2].code, .en)
        XCTAssertEqual(result.source?[2].name, "English (American)")
        XCTAssertEqual(result.target?[0].code, .en)
        XCTAssertEqual(result.target?[0].name, "English (British)")
    }

    /// Mastodon
    func testTranslationLanguages() throws {
        // arrange
        let json = localContent("translation_languages")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(
            [String: [String]]
                .self, from: json)

        // assert
        XCTAssertNotNil(result)
    }
}
