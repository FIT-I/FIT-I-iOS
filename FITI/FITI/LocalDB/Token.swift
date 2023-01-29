//
//  Token.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

import RealmSwift
import Realm

class Token:Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var token:String = ""
    
    override static func primaryKey() -> String? {
      return "token"
    }
    
    convenience init(token:String){
        self.init()
        self.token = token
    }
}
