import XCTest

@testable import TootSDK

final class PreferencesTests: XCTestCase {

    func test() throws {
        // arrange
        let json = localContent("preferences")
        let decoder = TootDecoder()

        // act
        let result = try decoder.decode(Preferences.self, from: json)

        // assert
        XCTAssertNotNil(result)
    }

}
