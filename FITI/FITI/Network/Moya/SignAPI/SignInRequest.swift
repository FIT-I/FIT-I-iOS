//
//  SignInService.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

struct SignInRequest: Codable {
    var fcmToken:String
    var id: String
    var password: String
    
    init(_ fcmToken:String,_ id: String, _ password: String) {
        self.fcmToken = fcmToken
        self.id = id
        self.password = password
    }
}
