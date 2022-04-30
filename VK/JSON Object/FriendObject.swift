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
