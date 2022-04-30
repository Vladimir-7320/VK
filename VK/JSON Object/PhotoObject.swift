//
//  PhotoObject.swift
//  VK
//
//  Created by Vladimir on 29.04.2022.
//  Copyright © 2022 vladimir73. All rights reserved.
//

import SwiftyJSON
import RealmSwift

class Photo: Object {
    @objc dynamic var count: Int = 0
    var photos: [JSON] =  []
    
    convenience init(json: JSON) {
        self.init()
        if let count = json["count"].int {
            self.count = count
        }
        if let items = json["items"].array {
            self.photos = items
        }
    }
}

class PhotoObject: Object {
    @objc dynamic var date: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var owner_id: Int = 0
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
        if let url = json["sizes"][7]["url"].string {
            self.photo_604 = url
        }
        
    }
    override static func primaryKey() -> String? {
        return "id"
    }
}

