//
//  PostsObject.swift
//  VK
//
//  Created by Владимир on 06/05/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//
import SwiftyJSON
import RealmSwift

class Posts: Object {
    @objc dynamic var count: Int = 0
    var items: [JSON] = []
    
    convenience init(json: JSON) {
        self.init()
        if let count = json["count"].int {
            self.count = count
        }
        if let items = json["items"].array {
            self.items = items
        }
    }
}

class PostsObject: Object{
    @objc dynamic var date: Int = 0
    @objc dynamic var text: String = ""
    var attachments: [JSON] = []
    
    convenience init(json: JSON) {
        self.init()
        if let date = json["date"].int {
            self.date = date
        }
        if let text = json["text"].string {
            self.text = text
        }
        if let attachments = json["attachments"].array {
            self.attachments = attachments
        }
    }
}

class PostsAttachmentsObject: Object {
    @objc dynamic var type: String = ""
    @objc dynamic var photo_75: String = ""
    @objc dynamic var photo_130: String = ""
    @objc dynamic var photo_604: String = ""
    @objc dynamic var photo_807: String = ""
    @objc dynamic var photo_1280: String = ""
    @objc dynamic var photo_2560: String = ""
    
    convenience init(json: JSON) {
        self.init()
        if let type = json["type"].string {
            self.type = type
        }
        if let photo_75 = json["photo"]["photo_75"].string {
            self.photo_75 = photo_75
        }
        if let photo_130 = json["photo"]["photo_130"].string {
            self.photo_130 = photo_130
        }
        if let photo_604 = json["photo"]["photo_604"].string {
            self.photo_604 = photo_604
        }
        if let photo_807 = json["photo"]["photo_807"].string {
            self.photo_807 = photo_807
        }
        if let photo_1280 = json["photo"]["photo_1280"].string {
            self.photo_1280 = photo_1280
        }
        if let photo_2560 = json["photo"]["photo_2560"].string {
            self.photo_2560 = photo_2560
        }
    }
}
