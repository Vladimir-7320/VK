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
