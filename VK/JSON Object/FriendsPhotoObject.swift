//
//  FriendsPhotoObject.swift
//  VK
//
//  Created by Владимир Харитонов on 20.04.2020.
//  Copyright © 2020 Mediasoft. All rights reserved.
//
import SwiftyJSON
import RealmSwift

class FriendsPhoto: Object {
    @objc dynamic var count: Int = 0
    var friendsPhoto: [JSON] = []
    
    convenience init(json: JSON) {
        self.init()
        if let count = json["count"].int {
            self.count = count
        }
        if let friendsPhoto = json["items"].array {
            self.friendsPhoto = friendsPhoto
        }
    }
}

class FriendsPhotoObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var photo_75: String = ""
    @objc dynamic var photo_130: String = ""
    @objc dynamic var photo_604: String = ""
    @objc dynamic var photo_807: String = ""
    @objc dynamic var photo_1280: String = ""
    @objc dynamic var photo_2560: String = ""
    @objc dynamic var width: Int = 0
    @objc dynamic var height: Int = 0
    @objc dynamic var date: Int = 0
    
    convenience init(json: JSON) {
        self.init()
        if let id = json["id"].int {
            self.id = id
        }
        if let photo_75 = json["photo_75"].string {
            self.photo_75 = photo_75
        }
        if let photo_130 = json["photo_130"].string {
            self.photo_130 = photo_130
        }
        if let photo_604 = json["photo_604"].string {
            self.photo_604 = photo_604
        }
        if let photo_807 = json["photo_807"].string {
            self.photo_807 = photo_807
        }
        if let photo_1280 = json["photo_1280"].string {
            self.photo_1280 = photo_1280
        }
        if let photo_2560 = json["photo_2560"].string {
            self.photo_2560 = photo_2560
        }
        if let width = json["width"].int {
            self.width = width
        }
        if let height = json["height"].int {
            self.height = height
        }
        if let date = json["date"].int {
            self.date = date
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

//{
//"response": {
//    "count": 12,
//    "items": [
//        {
//            "id": 457241751,
//            "album_id": -6,
//            "owner_id": 476470941,
//            "photo_75": "https://sun9-61.userapi.com/c857124/v857124119/87d1d/pugyhOinv3Q.jpg",
//            "photo_130": "https://sun9-53.userapi.com/c857124/v857124119/87d1e/IqMcghUMaYU.jpg",
//            "photo_604": "https://sun9-69.userapi.com/c857124/v857124119/87d1f/XHiU5XRes04.jpg",
//            "photo_807": "https://sun9-10.userapi.com/c857124/v857124119/87d20/fQjC96LsEcw.jpg",
//            "photo_1280": "https://sun9-45.userapi.com/c857124/v857124119/87d21/OulEW4sPJb4.jpg",
//            "photo_2560": "https://sun9-27.userapi.com/c857124/v857124119/87d22/IVuGWOxw_fI.jpg",
//            "width": 1620,
//            "height": 2160,
//            "text": "",
//            "date": 1578062015,
//            "post_id": 35
//        },
//        {
//            "id": 457241562,
//            "album_id": 268034006,
//            "owner_id": 476470941,
//            "photo_75": "https://sun9-59.userapi.com/c857136/v857136897/18ec4/YQQMD-sB3bo.jpg",
//            "photo_130": "https://sun9-43.userapi.com/c857136/v857136897/18ec5/X_XGgRAx7Iw.jpg",
//            "photo_604": "https://sun9-67.userapi.com/c857136/v857136897/18ec6/FrcA4PDArUA.jpg",
//            "photo_807": "https://sun9-19.userapi.com/c857136/v857136897/18ec7/45vHyWTE15w.jpg",
//            "photo_1280": "https://sun9-47.userapi.com/c857136/v857136897/18ec8/HlM7ztUQsGU.jpg",
//            "photo_2560": "https://sun9-38.userapi.com/c857136/v857136897/18ec9/fCRBl4Kof4M.jpg",
//            "width": 1600,
//            "height": 1200,
//            "text": "",
//            "date": 1571830949
//        },
//        {
