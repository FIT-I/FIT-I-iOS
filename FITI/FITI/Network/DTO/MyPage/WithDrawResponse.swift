//
//  WithDrawResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/03.
//

import Foundation
// MARK: - WithDrawResponse
struct WithDrawResponse: Codable {
    var isSuccess: Bool? = false
    var code: Int? = nil
    var message: String? = nil
    var result: String? = nil
}
