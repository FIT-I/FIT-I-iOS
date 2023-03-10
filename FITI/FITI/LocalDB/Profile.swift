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
    
    @Persisted var Name:String = ""
    @Persisted var PW:String = ""
    @Persisted var Email:String = ""
    @Persisted var Location:String = ""

    override static func primaryKey() -> String? {
      return "profile"
    }
    
    convenience init(Name:String,PW:String,Email:String,Location:String){
        self.init()
        self.Name = Name
        self.PW = PW
        self.Email = Email
        self.Location = Location
    }
}
