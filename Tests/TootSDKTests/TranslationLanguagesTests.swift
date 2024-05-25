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
        XCTAssertEqual(result.source?[0].code, "LV")
        XCTAssertEqual(result.source?[0].name, "Latvian")
    }
}
