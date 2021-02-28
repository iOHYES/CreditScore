//
//  ClearScoreUITests.swift
//  ClearScoreUITests
//
//  Created by Ujjwal on 27/02/2021.
//

import XCTest

class when_the_credit_score_is_fetched_from_api: XCTestCase {

  private var app: XCUIApplication!
  
  override func setUp() {
    super.setUp()
    
    self.app = XCUIApplication()
    self.app.launch()
  }
  
  
  func test_should_show_your_credit_score_label()
  {
    let yourCreditScoreLabel = self.app.staticTexts["yourScoreText"]
    XCTAssertEqual("Your credit score is", yourCreditScoreLabel.label, "")
  }
  
  func test_should_show_user_credit_score_fetched_from_api()
  {
    let scoreLabel = self.app.staticTexts["scoreLabel"]
    XCTAssertNotNil(scoreLabel.label, "Value for credit score nil")
  }
  
  func test_should_show_out_of_credit_score_fetched_from_api()
  {
    let outOfScoreLabel = self.app.staticTexts["outOfScoreLabel"]
    XCTAssertNotNil(outOfScoreLabel.label, "Value for out of max score nil")
  }
  
  func test_app_orientation(){
    XCUIDevice.shared.orientation = .landscapeRight
    XCUIDevice.shared.orientation = .portraitUpsideDown
    XCUIDevice.shared.orientation = .landscapeLeft
    XCUIDevice.shared.orientation = .portrait
  }
  
}
