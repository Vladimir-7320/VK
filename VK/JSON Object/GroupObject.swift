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
