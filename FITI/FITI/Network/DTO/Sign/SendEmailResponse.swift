//
//  SendMailResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/12.
//

import Foundation

struct SendEmailResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    var result: String? = nil
}
