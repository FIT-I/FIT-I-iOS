//
//  SuccessMatchResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/04.
//

import Foundation

// MARK: - SuccessMatchResponse
struct SuccessMatchResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SuccessMatchSheet]
}

// MARK: - Result
struct SuccessMatchSheet: Codable {
    var openChatLink: String? = nil
    let trainerId: Int
    let trainerName: String
    let trainerGrade: Int
    let trainerSchool: String
    let customerId: Int
    var pickUp: String? = nil
    var customerLocation: String? = nil
    let createdAt: String
}
