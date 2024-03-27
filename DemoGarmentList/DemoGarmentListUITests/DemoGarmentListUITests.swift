import XCTest

class DemoGarmentListUITests: XCTestCase {

    var app: XCUIApplication!
    // Define Constants
        struct Constants {
            static let enterName = "Enter garment name"
        }
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testAddGarment() throws {
        // Navigate to the "Add" screen
        app.buttons["plus"].tap()

        // Verify that we're in the "Add" screen
        XCTAssertTrue(app.navigationBars["Add"].exists)

        // Enter a garment name
        let garmentNameTextField = app.textFields[Constants.enterName]
        garmentNameTextField.tap()
        garmentNameTextField.typeText("Test Garment")

        // Tap the "Save" button
        app.buttons["Save"].tap()

        // Verify that the new garment is added to the list
        XCTAssertTrue(app.staticTexts["Test Garment"].exists)
    }

    func testSortGarments() throws {
        // Tap the "Alphabetical" segment
        app.segmentedControls.buttons["Alphabetical"].tap()

        // XCTAssertTrue(app.staticTexts["Garment 1"].exists)
        // XCTAssertTrue(app.staticTexts["Garment 2"].exists)
        // XCTAssertTrue(app.staticTexts["Garment 3"].exists)

        // Tap the "Creation Date" segment
        app.segmentedControls.buttons["Creation Date"].tap()

        // XCTAssertTrue(app.staticTexts["Garment 3"].exists)
        // XCTAssertTrue(app.staticTexts["Garment 2"].exists)
        // XCTAssertTrue(app.staticTexts["Garment 1"].exists)
    }

    func testNavigationToAddGarmentView() throws {
        app.buttons["plus"].tap()

        XCTAssertTrue(app.navigationBars["Add"].exists)
    }
}
