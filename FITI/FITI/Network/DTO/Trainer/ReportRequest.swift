//
//  ReportRequest.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/07.
//

import Foundation

// MARK: - ReportRequest
struct ReportRequest: Codable {
    let trainerId: Int
    let reason: String
    
    init(trainerId: Int, reason: String) {
        self.trainerId = trainerId
        self.reason = reason
    }
}
