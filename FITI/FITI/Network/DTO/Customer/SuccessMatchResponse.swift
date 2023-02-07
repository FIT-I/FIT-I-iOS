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
    let trainerGrade: Double
    var trainerSchool: String? = nil
    let customerId: Int
    var customerName: String? = nil
    let createdAt: String
    var pickUp: String? = nil
    var customerLocation: String? = nil
    let matchingId: Int
    var trainerProfile: String? = nil
    var trainerLocation: String? = nil
    var customerProfile: String? = nil

}

