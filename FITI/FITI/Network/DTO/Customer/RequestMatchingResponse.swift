//
//  RequestMatchingResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/02.
//

import Foundation
struct RequestMatchingResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    var result: String? = ""
}
