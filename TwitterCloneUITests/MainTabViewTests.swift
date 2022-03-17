//
//  MainTabView.swift
//  TwitterCloneUITests
//
//  Created by Takahiro Tominaga on 2022/03/15.
//

import XCTest
@testable import TwitterClone

// Naming Structure: test_UinitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct]_[ui component]_[expected result]
// Testing Structure: Given, When, Then

// example
// test_UITestingBootcampView_signUpButton_shouldSignIn()

class MainTabViewTests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_TwitterClone_signUpButtonInSignInPage_shouldNavigateSignUpPage() throws {

        app.buttons["Sign In"].tap()
    }

    func test_TwitterClone_signInPage_shouldShowCorrectly() throws {
        // Given
        // UITest の Compile Sources に、TestTags を追加する必要がある！
        let emailField = app.textFields[TestTags.emailInSignIn]
        // secureTextField と使い分けるのだるい
        let passwordField = app.secureTextFields[TestTags.passwordInSignIn]

        let signInButton = app.buttons["Sign In"]

        // When

        // Then
        XCTAssertTrue(emailField.exists)
        XCTAssertTrue(passwordField.exists)
        XCTAssertTrue(signInButton.exists)
    }

    func test_TwitterClone_signUpButton_shouldNotSignIn() throws {
        // Given
        // UITest の Compile Sources に、TestTags を追加する必要がある！
        let emailField = app.textFields[TestTags.emailInSignIn]
        // secureTextField と使い分けるのだるい
        let passwordField = app.secureTextFields[TestTags.passwordInSignIn]

        //        emailField.tap()
        //        app.keys["A"].tap()
        //        let wKey = app.keys["w"]
        //        wKey.tap()
        //        wKey.tap()
        //        wKey.tap()
        //        app.keys["numbers"].tap()
        //        app.keys["@"].tap()
        //        app.keys["letters"].tap()
        //        app.keys["g"].tap()
        //        app.keys["m"].tap()
        //        app.keys["a"].tap()
        //        app.keys["i"].tap()
        //        app.keys["l"].tap()
        //        app.keys["numbers"].tap()
        //        app.keys["."].tap()
        //        app.keys["letters"].tap()
        //        app.keys["c"].tap()
        //        app.keys["o"].tap()
        //        app.keys["m"].tap()
        //        app.buttons["Return"].tap()
        //
        //        passwordField.tap()
        //        app.keys["a"].tap()
        //        let sKey = app.keys["s"]
        //        sKey.tap()
        //        sKey.tap()
        //        wKey.tap()
        //        wKey.tap()
        //        wKey.tap()
        //        wKey.tap()
        //        app.buttons["Return"].tap()

        // When
        app.buttons["Sign In"].tap()

        // Then
        XCTAssertTrue(app.buttons["Sign In"].exists)
        // navBar = app.navigatonBars["Welcom"]
    }

}
