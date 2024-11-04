import MacroDemoLib
import MacroDemo
import XCTest

public class MacroDemoLibTests : XCTestCase {
    func testMacroDemoLib() {
        XCTAssertEqual("1 + 2", demoStringify())
    }

    func testMacroDemoMacro() {
        XCTAssertEqual("1 + 2", (#stringify(1 + 2)).1)
    }
}
