import XCTest

class DemoGarmentListUITestsLaunchTests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testAppLaunch() throws {
        // Assert that the app launched successfully
        XCTAssertTrue(app.exists)
        print(app.navigationBars["List"].buttons.allElementsBoundByAccessibilityElement.count)
        for button in app.navigationBars["List"].buttons.allElementsBoundByAccessibilityElement {
            print(button.label)
        }

        // Assert that the "plus" button exists
        XCTAssertTrue(app.buttons["plus"].exists)
    }
    
}
