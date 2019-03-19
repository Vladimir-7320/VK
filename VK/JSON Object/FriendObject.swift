//
//  FriendObject.swift
//  VK
//
//  Created by Владимир on 21/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//
import SwiftyJSON
import RealmSwift

class Friends: Object {
    @objc dynamic var count: Int = 0
    var friends: [JSON] = []
    
    convenience init(json: JSON) {
        self.init()
        if let count = json["count"].int {
            self.count = count
        }
        if let items = json["items"].array {
            self.friends = items
        }
    }
}

class FriendObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var bdate: String = ""
    @objc dynamic var cityTitle: String = ""
    @objc dynamic var countryTitle: String = ""
    @objc dynamic var domain: String = ""
    @objc dynamic var first_name: String = ""
    @objc dynamic var last_name: String = ""
    @objc dynamic var online: Int = 0
    @objc dynamic var photo_100: String = ""
    @objc dynamic var photo_200_orig: String = ""
    @objc dynamic var photo_50: String = ""
    
    convenience init(json: JSON) {
        self.init()
        if let id = json["id"].int {
            self.id = id
        }
        if let bdate = json["bdate"].string {
            self.bdate = bdate
        }
        if let city = json["city"]["title"].string {
            self.cityTitle = city
        }
        if let country = json["country"]["title"].string {
            self.countryTitle = country
        }
        if let domain = json["domain"].string {
            self.domain = domain
        }
        if let first_name = json["first_name"].string {
            self.first_name = first_name
        }
        if let last_name = json["last_name"].string {
            self.last_name = last_name
        }
        if let online = json["online"].int {
            self.online = online
        }
        if let photo_100 = json["photo_100"].string {
            self.photo_100 = photo_100
        }
        if let photo_200_orig = json["photo_200_orig"].string {
            self.photo_200_orig = photo_200_orig
        }
        if let photo_50 = json["photo_50"].string {
            self.photo_50 = photo_50
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Друзья. Важные параметры

// count - количество друзей
// bdate - дата рождения
// city - город
// country - страна
// domain - домен
// first_name - имя друга
// last_name - фамилия друга
// online - в сети 1, не в сети 0
// photo_100 - фото 100 пикселей
// photo_200_orig - фото 200 пикселей оригинальное
// photo_50 - фото 50 пикселей

//{
//    "response": {
//        "count": 12,
//        "items": [
//        {
//        "id": 1156755,
//        "first_name": "Виктория",
//        "last_name": "Бородина",
//        "domain": "id1156755",
//        "bdate": "27.4.1988",
//        "city": {
//        "id": 208,
//        "title": "San Francisco"
//        },
//        "country": {
//        "id": 9,
//        "title": "США"
//        },
//        "photo_50": "https://sun1-21.userapi.com/c626627/v626627755/3a9f4/lGJ3KRQtOSU.jpg?ava=1",
//        "photo_100": "https://sun1-24.userapi.com/c626627/v626627755/3a9f3/vCmFH8BrYTk.jpg?ava=1",
//        "photo_200_orig": "https://sun1-26.userapi.com/c626627/v626627755/3a9f1/8mzulYJ7HgU.jpg?ava=1",
//        "online": 0
//        },
