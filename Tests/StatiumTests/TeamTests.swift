@testable import Statium
import XCTest

final class TeamTests: XCTestCase {
    func testExample() throws {
        let team = try Team("Paris Saint-Germain")
        XCTAssertEqual(team.mediumName, "Paris SG")
    }
}
