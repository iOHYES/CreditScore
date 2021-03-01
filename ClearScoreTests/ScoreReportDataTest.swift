//
//  ScoreReportDataTest.swift
//  ClearScoreTests
//
//  Created by Ujjwal on 01/03/2021.
//

import XCTest
@testable import ClearScore

class when_the_score_json_data_available: XCTestCase {

  func test_parse_score_data(){
    
    guard let pathString =  Bundle(for: type(of: self)).path(forResource: "score", ofType: "json") else {
      fatalError("Json not found")
    }
    
    guard let json = try? String(contentsOfFile: pathString, encoding: .utf8) else {
      fatalError("Unable to convert json to String")
    }
    let jsonData = json.data(using: .utf8)!
    
    let response = ResponseDecoder()
    let scoreData = try! response.decode(CSReport.self, data: jsonData)!

    
    XCTAssertEqual(514, scoreData.creditReportInfo.score, "credit score parsed issue")
    XCTAssertEqual(700, scoreData.creditReportInfo.maxScoreValue, "credit maxScoreValue parsed issue")

  }
}
