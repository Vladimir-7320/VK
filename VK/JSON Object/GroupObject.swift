//
//  GroupObject.swift
//  VK
//
//  Created by Владимир on 20/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//
import SwiftyJSON
import RealmSwift

class Group: Object {
    @objc dynamic var count: Int = 0
    var groups: [JSON] =  []
    
    convenience init(json: JSON) {
        self.init()
        if let count = json["count"].int {
            self.count = count
        }
        if let items = json["items"].array {
            self.groups = items
        }
    }
}

class GroupObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var is_closed: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photo_100: String = ""
    @objc dynamic var photo_200: String = ""
    @objc dynamic var photo_50: String = ""
    
    convenience init(json: JSON) {
        self.init()
        if let id = json["id"].int {
            self.id = id
        }
        if let is_closed = json["is_closed"].int {
            self.is_closed = is_closed
        }
        if let name = json["name"].string {
            self.name = name
        }
        if let photo_100 = json["photo_100"].string {
            self.photo_100 = photo_100
        }
        if let photo_200 = json["photo_200"].string {
            self.photo_200 = photo_200
        }
        if let photo_50 = json["photo_50"].string {
            self.photo_50 = photo_50
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

//{
//    response =     {
//        count = 2;
//        items =         (
//            {
//                id = 43001537;
//                "is_admin" = 0;
//                "is_advertiser" = 0;
//                "is_closed" = 0;
//                "is_member" = 1;
//                name = "Apple | iPhone | iPad";
//                "photo_100" = "https://sun1-22.userapi.com/c848636/v848636355/159050/gY-O38GucsQ.jpg?ava=1";
//                "photo_200" = "https://sun1-83.userapi.com/c848636/v848636355/15904f/LU5ninJPvNk.jpg?ava=1";
//                "photo_50" = "https://sun1-83.userapi.com/c848636/v848636355/159051/YXXaWMERYR8.jpg?ava=1";
//                "screen_name" = "apple.inside";
//                type = page;
//        },
//            {
//                id = 36516005;
//                "is_admin" = 0;
//                "is_advertiser" = 0;
//                "is_closed" = 0;
//                "is_member" = 1;
//                name = "\U0421\U0438\U043d\U0435\U043c\U0430 \U041f\U0430\U0440\U043a & \U0424\U043e\U0440\U043c\U0443\U043b\U0430 \U041a\U0438\U043d\U043e";
//                "photo_100" = "https://sun1-89.userapi.com/c845416/v845416897/12a9f4/HOkgzwfSsiE.jpg?ava=1";
//                "photo_200" = "https://sun1-14.userapi.com/c845416/v845416897/12a9f3/KQfHxJiQCGY.jpg?ava=1";
//                "photo_50" = "https://sun1-89.userapi.com/c845416/v845416897/12a9f5/61j5gyYoXSA.jpg?ava=1";
//                "screen_name" = kinoteatr;
//                type = page;
//        }
//        );
//    };
//}
