//
//  NotificationForNewPost.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

import RealmSwift
import Realm

class CustomNotification:Object{
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var title:String = ""
    @Persisted var body:String = ""
    @Persisted var link:String = ""

    override static func primaryKey() -> String? {
      return "Notification"
    }

    convenience init(title:String,body:String,link:String){
        self.init()
        self.title = title
        self.body = body
        self.link = link
    }

}
