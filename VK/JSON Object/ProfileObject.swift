//
//  ProfileObject.swift
//  VK
//
//  Created by Владимир on 21/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//
import SwiftyJSON
import RealmSwift

class Profile: Object {
    @objc dynamic var first_name: String = ""
    @objc dynamic var last_name: String = ""
    @objc dynamic var sex: Int = 0
    @objc dynamic var domain: String = ""
    @objc dynamic var bdate: String = ""
    @objc dynamic var cityTitle: String = ""
    @objc dynamic var countryTitle: String = ""
    @objc dynamic var photo_50: String = ""
    @objc dynamic var photo_100: String = ""
    @objc dynamic var photo_200: String = ""
    @objc dynamic var photo_max: String = ""
    @objc dynamic var photo_200_orig: String = ""
    @objc dynamic var photo_400_orig: String = ""
    @objc dynamic var photo_max_orig: String = ""
    @objc dynamic var online: Int = 0
    @objc dynamic var home_town: String = ""
    
    convenience init(json: JSON) {
        self.init()
        if let first_name = json[0]["first_name"].string {
            self.first_name = first_name
        }
        if let last_name = json[0]["last_name"].string {
            self.last_name = last_name
        }
        if let sex = json[0]["sex"].int {
            self.sex = sex
        }
        if let domain = json[0]["domain"].string {
            self.domain = domain
        }
        if let bdate = json[0]["bdate"].string {
            self.bdate = bdate
        }
        if let cityTitle = json[0]["city"]["title"].string {
            self.cityTitle = cityTitle
        }
        if let countryTitle = json[0]["country"]["title"].string {
            self.countryTitle = countryTitle
        }
        if let photo_50 = json[0]["photo_50"].string {
            self.photo_50 = photo_50
        }
        if let photo_100 = json[0]["photo_100"].string {
            self.photo_100 = photo_100
        }
        if let photo_200 = json[0]["photo_200"].string {
            self.photo_200 = photo_200
        }
        if let photo_max = json[0]["photo_max"].string {
            self.photo_max = photo_max
        }
        if let photo_200_orig = json[0]["photo_200_orig"].string {
            self.photo_200_orig = photo_200_orig
        }
        if let photo_400_orig = json[0]["photo_400_orig"].string {
            self.photo_400_orig = photo_400_orig
        }
        if let photo_max_orig = json[0]["photo_max_orig"].string {
            self.photo_max_orig = photo_max_orig
        }
        if let online = json[0]["online"].int {
            self.online = online
        }
        if let home_town = json[0]["home_town"].string {
            self.home_town = home_town
        }
    }
}
