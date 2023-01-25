//
//  SignInService.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

struct SignInRequest: Codable {
    var email: String
    var password: String
    
    init(_ email: String, _ password: String) {
        self.email = email
        self.password = password
    }
}
