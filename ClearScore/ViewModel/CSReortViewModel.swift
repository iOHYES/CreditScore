//
//  CSReortViewModel.swift
//  ClearScore
//
//  Created by Chafle, Ujjwal on 02/03/2021.
//

import Foundation
import UIKit
import SwiftUI

class CSReortViewModel:ObservableObject {

    @Published  var score: String            = ""
    @Published  var maxScoreValue: String    = ""
    @Published  var circleProgress: CGFloat  = 0.0
    @Published  var isError                  = (false,"")
    @Published  var isLoading                = true
    @Published  var isAlert                  = false
    
    var service = CSCreditReportService()

    init() {
        self.getScoreData()
    }
    
    func getScoreData()
    {
        service.delegate = self
        service.getCreditReport()
    }
    
    private func startLoading(creditScore: Int, totalScore: Int)
    {
      for _ in 0...creditScore {
        withAnimation() {
          if self.circleProgress <= CGFloat(creditScore)/CGFloat(totalScore) {
              self.circleProgress += 0.1
          }
        }
      }
    }
    
}

extension CSReortViewModel: CreditReportServiceDelegate {
    
    func didReciveResponse(response: CSReport) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.score = "\(response.creditReportInfo.score)"
            self.maxScoreValue = "\(response.creditReportInfo.maxScoreValue)"
            self.startLoading(creditScore: response.creditReportInfo.score, totalScore: response.creditReportInfo.maxScoreValue)
        }
        print("Credit score-\(response.creditReportInfo.score) out of \(response.creditReportInfo.maxScoreValue) ")
    }
    
    func didReciveError(error: String) {
        DispatchQueue.main.async {
            self.isLoading.toggle()
            self.isAlert.toggle()
            self.isError = (true, error)
        }
    }
    

}
