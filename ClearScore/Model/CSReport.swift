//
//  CSReport.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

// MARK: - CSReport
struct CSReport: Codable {
    let creditReportInfo: CreditReportInfo
}

// MARK: - CreditReportInfo
struct CreditReportInfo: Codable {
    let score, maxScoreValue: Int
}
