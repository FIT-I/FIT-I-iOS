//
//  Profile.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

import RealmSwift
import Realm

class Profile:Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var ID:String = ""
    @Persisted var PW:String = ""
    @Persisted var Email:String = ""
    @Persisted var Location:String = ""

    override static func primaryKey() -> String? {
      return "profile"
    }
    
    convenience init(ID:String,PW:String,Email:String,Location:String){
        self.init()
        self.ID = ID
        self.PW = PW
        self.Email = Email
        self.Location = Location
    }
}
