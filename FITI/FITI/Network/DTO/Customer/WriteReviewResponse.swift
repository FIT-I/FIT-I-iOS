//
//  WriteReviewResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/06.
//

import Foundation

struct WriteReviewResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message, result: String
}
