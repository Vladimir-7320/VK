//
//  FriendsPhotoObject.swift
//  VK
//
//  Created by Vladimir on 29.04.2022.
//  Copyright © 2022 vladimir73. All rights reserved.
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
    @objc dynamic var date: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var owner_id: Int = 0
    @objc dynamic var post_id: Int = 0
    @objc dynamic var height: Int = 0
    @objc dynamic var width: Int = 0
    @objc dynamic var photo_604: String = ""
    
    convenience init(json: JSON) {
        self.init()
        
        if let date = json["date"].int {
            self.date = date
        }
        if let id = json["id"].int {
            self.id = id
        }
        if let owner_id = json["owner_id"].int {
            self.owner_id = owner_id
        }
        if let post_id = json["post_id"].int {
            self.post_id = post_id
        }
        if let height = json["sizes"]["height"].int {
            self.height = height
        }
        if let width = json["sizes"]["width"].int {
            self.width = width
        }
        let sizes = json["sizes"].arrayValue
        if let zSizes = sizes.filter ({ $0["type"] == "x" }).first {
            self.photo_604 = zSizes["url"].stringValue
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
