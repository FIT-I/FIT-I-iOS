//
//  MatchSheetResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/02.
//

import Foundation

// MARK: - MatchSheetResponse
struct MatchSheetResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: MatchSheet
}

// MARK: - Result
struct MatchSheet: Codable {
    var matchingID: Int? = nil
    var ustomerID: Int? = nil
    var name: String? = nil
    var pricePerHour: String? = nil
    var totalPrice: String? = nil
    var matchingStart: String? = nil
    var matchingFinish: String? = nil
    var matchingPeriod: Int? = nil
    var pickUpType: String? = nil
    var location: String? = nil
}
