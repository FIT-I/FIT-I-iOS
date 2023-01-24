//
//  SignInService.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

struct SignInRequest: Codable {
    var id: String
    var password: String
    
    init(_ id: String, _ password: String) {
        self.id = id
        self.password = password
    }
}
