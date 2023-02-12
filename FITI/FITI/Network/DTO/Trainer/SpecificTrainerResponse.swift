//
//  SpecificTrainerResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation

// MARK: - SpecificTrainerResponse
struct SpecificTrainerResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Trainer
}

// MARK: - Trainer
struct Trainer: Codable {
    var profile: String? = "trainerProfile"
    var background: String? = "trainerProfile"
    var name: String? = nil
    var levelName: String? = nil
    var school: String? = nil
    var grade: Double = 0
    var cost: String? = ""
    var intro: String? = ""
    var service: String? = ""
    var reviewDto: [ReviewDto]? = nil
    var imageList: [String]? = nil
    init(){}
}

// MARK: - ReviewDto
struct ReviewDto: Codable {
    let name: String
    var profile: String? = nil
    let grade: Double
    let createdAt: String
    var contents: String? = nil
}
