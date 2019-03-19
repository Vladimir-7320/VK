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

//// Парсинг получение постов текущего пользователя
//{
//    "response": {
//        "count": 5,
//        "items": [
//        {
//        "id": 995,
//        "from_id": 163601900,
//        "owner_id": 163601900,
//        "date": 1554714804,
//        "post_type": "post",
//        "text": "Дать отдых голове трудней, чем телу!\nРебята спасибо за клевые выходные",
//        "can_delete": 1,
//        "can_pin": 1,
//        "can_archive": true,
//        "is_archived": false,
//        "attachments": [
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456242501,
//        "album_id": -7,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c849036/v849036475/165263/IqG8bOfwbj4.jpg",
//        "photo_130": "https://pp.userapi.com/c849036/v849036475/165264/FznZBe9ZYg0.jpg",
//        "photo_604": "https://pp.userapi.com/c849036/v849036475/165265/Fa4I6P8e98I.jpg",
//        "photo_807": "https://pp.userapi.com/c849036/v849036475/165266/LbaGDGosYes.jpg",
//        "photo_1280": "https://pp.userapi.com/c849036/v849036475/165267/A86hKK8kqtY.jpg",
//        "photo_2560": "https://pp.userapi.com/c849036/v849036475/165268/NYJclXI7uJA.jpg",
//        "width": 1536,
//        "height": 2048,
//        "text": "",
//        "date": 1554714109,
//        "lat": 54.244413,
//        "long": 47.675113,
//        "access_key": "432f74fabbf6d7015e"
//        }
//        },
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456242502,
//        "album_id": -7,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c849036/v849036475/16526d/VjAj68mlh-Q.jpg",
//        "photo_130": "https://pp.userapi.com/c849036/v849036475/16526e/tdEGPWdKHiI.jpg",
//        "photo_604": "https://pp.userapi.com/c849036/v849036475/16526f/u7RaWimrTOo.jpg",
//        "photo_807": "https://pp.userapi.com/c849036/v849036475/165270/dBRSysSURoE.jpg",
//        "photo_1280": "https://pp.userapi.com/c849036/v849036475/165271/Djf_ArBr5ok.jpg",
//        "photo_2560": "https://pp.userapi.com/c849036/v849036475/165272/QHhbhQlcSHI.jpg",
//        "width": 2048,
//        "height": 1536,
//        "text": "",
//        "date": 1554714110,
//        "lat": 54.244325,
//        "long": 47.675136,
//        "access_key": "1ca3ad98d28767d9ae"
//        }
//        },
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456242503,
//        "album_id": -7,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c849036/v849036475/165277/q28ew08jy0A.jpg",
//        "photo_130": "https://pp.userapi.com/c849036/v849036475/165278/w8QPRWWadD4.jpg",
//        "photo_604": "https://pp.userapi.com/c849036/v849036475/165279/ZOWyGPnkyDU.jpg",
//        "photo_807": "https://pp.userapi.com/c849036/v849036475/16527a/xMPVvXigyFY.jpg",
//        "photo_1280": "https://pp.userapi.com/c849036/v849036475/16527b/6EpFij3ksbE.jpg",
//        "photo_2560": "https://pp.userapi.com/c849036/v849036475/16527c/PE1TQUcp-0Q.jpg",
//        "width": 2048,
//        "height": 1536,
//        "text": "",
//        "date": 1554714111,
//        "lat": 54.244469,
//        "long": 47.674967,
//        "access_key": "946345f123df01404f"
//        }
//        },
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456242504,
//        "album_id": -7,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c849036/v849036475/165281/rStPSqmadww.jpg",
//        "photo_130": "https://pp.userapi.com/c849036/v849036475/165282/eMzm0TU4i-c.jpg",
//        "photo_604": "https://pp.userapi.com/c849036/v849036475/165283/SPjzr9vY5DM.jpg",
//        "photo_807": "https://pp.userapi.com/c849036/v849036475/165284/bflx-PiLdcs.jpg",
//        "photo_1280": "https://pp.userapi.com/c849036/v849036475/165285/z_-BGEUmMc8.jpg",
//        "photo_2560": "https://pp.userapi.com/c849036/v849036475/165286/niSlfsPjEgM.jpg",
//        "width": 2048,
//        "height": 1536,
//        "text": "",
//        "date": 1554714111,
//        "lat": 54.244469,
//        "long": 47.674967,
//        "access_key": "25c276f5081a9c2fef"
//        }
//        },
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456242510,
//        "album_id": -7,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c844618/v844618475/1e1688/KIqdrW2XyOo.jpg",
//        "photo_130": "https://pp.userapi.com/c844618/v844618475/1e1689/dnigUupqiSA.jpg",
//        "photo_604": "https://pp.userapi.com/c844618/v844618475/1e168a/6Uv3y1eTFZU.jpg",
//        "photo_807": "https://pp.userapi.com/c844618/v844618475/1e168b/u3bT911Qzf8.jpg",
//        "photo_1280": "https://pp.userapi.com/c844618/v844618475/1e168c/dutoutMuRxk.jpg",
//        "photo_2560": "https://pp.userapi.com/c844618/v844618475/1e168d/96gZXCEGp-o.jpg",
//        "width": 2048,
//        "height": 1152,
//        "text": "",
//        "date": 1554715773,
//        "access_key": "9b6babf1a1ae8571bb"
//        }
//        },
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456242507,
//        "album_id": -7,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c849132/v849132773/168512/-RjTKdBlSvQ.jpg",
//        "photo_130": "https://pp.userapi.com/c849132/v849132773/168513/LFUo-g2CNkQ.jpg",
//        "photo_604": "https://pp.userapi.com/c849132/v849132773/168514/So4j5qSfRa8.jpg",
//        "photo_807": "https://pp.userapi.com/c849132/v849132773/168515/pnG9rOyq01s.jpg",
//        "photo_1280": "https://pp.userapi.com/c849132/v849132773/168516/RRWFhAmEImI.jpg",
//        "photo_2560": "https://pp.userapi.com/c849132/v849132773/168517/uX6iaOOvCZg.jpg",
//        "width": 2048,
//        "height": 1538,
//        "text": "",
//        "date": 1554715320,
//        "lat": 54.150167,
//        "long": 47.649809,
//        "access_key": "0361f4fce19723fcf0"
//        }
//        },
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456242508,
//        "album_id": -7,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c844418/v844418475/1e1a65/ywfGO3JK4Fk.jpg",
//        "photo_130": "https://pp.userapi.com/c844418/v844418475/1e1a66/V0fPow0IRPg.jpg",
//        "photo_604": "https://pp.userapi.com/c844418/v844418475/1e1a67/EFjMbhXL9D4.jpg",
//        "photo_807": "https://pp.userapi.com/c844418/v844418475/1e1a68/ZMsWLLXjM0E.jpg",
//        "photo_1280": "https://pp.userapi.com/c844418/v844418475/1e1a69/ruGcwboRlCI.jpg",
//        "photo_2560": "https://pp.userapi.com/c844418/v844418475/1e1a6a/_r2CpYbBFqo.jpg",
//        "width": 1536,
//        "height": 2048,
//        "text": "",
//        "date": 1554715340,
//        "lat": 54.110978,
//        "long": 47.619067,
//        "access_key": "d3205d60f61844eb3a"
//        }
//        },
//        {
//        "type": "audio",
//        "audio": {
//        "id": 456242701,
//        "owner_id": 2000316263,
//        "artist": "Avril Lavin",
//        "title": "Gierlfriend",
//        "duration": 25,
//        "date": 1554714804,
//        "url": "https://vk.com/mp3/audio_api_unavailable.mp3",
//        "genre_id": 18,
//        "no_search": 1,
//        "is_hq": false
//        }
//        }
//        ],
//        "post_source": {
//        "type": "api",
//        "platform": "iphone"
//        },
//        "comments": {
//        "count": 0,
//        "can_post": 1,
//        "groups_can_post": true
//        },
//        "likes": {
//        "count": 12,
//        "user_likes": 0,
//        "can_like": 1,
//        "can_publish": 1
//        },
//        "reposts": {
//        "count": 0,
//        "user_reposted": 0
//        },
//        "views": {
//        "count": 203
//        }
//        },
//        {
//        "id": 983,
//        "from_id": 163601900,
//        "owner_id": 163601900,
//        "date": 1546708474,
//        "post_type": "post",
//        "text": "Новый Год 🎄 2019",
//        "can_delete": 1,
//        "can_pin": 1,
//        "can_archive": true,
//        "is_archived": false,
//        "attachments": [
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456242377,
//        "album_id": -7,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c850420/v850420216/822fc/uSlJAQjJKUk.jpg",
//        "photo_130": "https://pp.userapi.com/c850420/v850420216/822fd/mn_ZfTOiLaU.jpg",
//        "photo_604": "https://pp.userapi.com/c850420/v850420216/822fe/IflEC-GqQxc.jpg",
//        "photo_807": "https://pp.userapi.com/c850420/v850420216/822ff/-tGwGSINiY4.jpg",
//        "photo_1280": "https://pp.userapi.com/c850420/v850420216/82300/QalnOMkJf0s.jpg",
//        "photo_2560": "https://pp.userapi.com/c850420/v850420216/82301/SooIXr461sk.jpg",
//        "width": 1534,
//        "height": 2048,
//        "text": "",
//        "date": 1546708852,
//        "access_key": "cce81e4d31070143dd"
//        }
//        },
//        {
//        "type": "audio",
//        "audio": {
//        "id": 456242727,
//        "owner_id": 2000131373,
//        "artist": "Zara Larsson",
//        "title": "Ruin My Life",
//        "duration": 25,
//        "date": 1546709282,
//        "url": "https://vk.com/mp3/audio_api_unavailable.mp3",
//        "is_hq": true
//        }
//        }
//        ],
//        "post_source": {
//        "type": "api",
//        "platform": "iphone"
//        },
//        "comments": {
//        "count": 0,
//        "can_post": 1,
//        "groups_can_post": true
//        },
//        "likes": {
//        "count": 16,
//        "user_likes": 0,
//        "can_like": 1,
//        "can_publish": 1
//        },
//        "reposts": {
//        "count": 0,
//        "user_reposted": 0
//        },
//        "views": {
//        "count": 480
//        }
//        },
//        {
//        "id": 977,
//        "from_id": 163601900,
//        "owner_id": 163601900,
//        "date": 1545998168,
//        "post_type": "post",
//        "text": "",
//        "can_delete": 1,
//        "can_pin": 1,
//        "can_archive": true,
//        "is_archived": false,
//        "attachments": [
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456242274,
//        "album_id": -7,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c852320/v852320329/77699/IiCJTUhKe6w.jpg",
//        "photo_130": "https://pp.userapi.com/c852320/v852320329/7769a/hxzgzEyyLw8.jpg",
//        "photo_604": "https://pp.userapi.com/c852320/v852320329/7769b/Lt-wa-VyC9Q.jpg",
//        "photo_807": "https://pp.userapi.com/c852320/v852320329/7769c/TzDALXYfa-A.jpg",
//        "photo_1280": "https://pp.userapi.com/c852320/v852320329/7769d/LG9-_PKZIJM.jpg",
//        "photo_2560": "https://pp.userapi.com/c852320/v852320329/7769e/fUisN0oAziA.jpg",
//        "width": 2048,
//        "height": 1367,
//        "text": "",
//        "date": 1545998037,
//        "access_key": "7b975d18bd0bbe6f4a"
//        }
//        },
//        {
//        "type": "audio",
//        "audio": {
//        "id": 456242729,
//        "owner_id": 2000114333,
//        "artist": "Jessie J",
//        "title": "Mamma Knows Best",
//        "duration": 25,
//        "date": 1545998168,
//        "url": "https://vk.com/mp3/audio_api_unavailable.mp3",
//        "is_hq": true
//        }
//        }
//        ],
//        "post_source": {
//        "type": "api",
//        "platform": "iphone"
//        },
//        "comments": {
//        "count": 0,
//        "can_post": 1,
//        "groups_can_post": true
//        },
//        "likes": {
//        "count": 12,
//        "user_likes": 0,
//        "can_like": 1,
//        "can_publish": 1
//        },
//        "reposts": {
//        "count": 0,
//        "user_reposted": 0
//        },
//        "views": {
//        "count": 368
//        }
//        },
//        {
//        "id": 974,
//        "from_id": 163601900,
//        "owner_id": 163601900,
//        "date": 1543145961,
//        "post_type": "post",
//        "text": "",
//        "can_delete": 1,
//        "can_pin": 1,
//        "can_archive": true,
//        "is_archived": false,
//        "attachments": [
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456242233,
//        "album_id": -6,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c850624/v850624592/50da1/_ScD9vZ1TGg.jpg",
//        "photo_130": "https://pp.userapi.com/c850624/v850624592/50da2/V0HVvxra_JA.jpg",
//        "photo_604": "https://pp.userapi.com/c850624/v850624592/50da3/ylgLuaP613g.jpg",
//        "photo_807": "https://pp.userapi.com/c850624/v850624592/50da4/-szC3JloQQU.jpg",
//        "photo_1280": "https://pp.userapi.com/c850624/v850624592/50da5/DeXvXYs1wD0.jpg",
//        "photo_2560": "https://pp.userapi.com/c850624/v850624592/50da6/THmQL3g1Y3E.jpg",
//        "width": 1539,
//        "height": 2048,
//        "text": "",
//        "date": 1543145905,
//        "post_id": 973
//        }
//        },
//        {
//        "type": "audio",
//        "audio": {
//        "id": 456241787,
//        "owner_id": 2000048885,
//        "artist": "Snoh Aalegra feat. Vince Staples",
//        "title": "Nothing Burns Like The Cold",
//        "duration": 25,
//        "date": 1543145961,
//        "url": "https://vk.com/mp3/audio_api_unavailable.mp3",
//        "is_hq": true
//        }
//        }
//        ],
//        "post_source": {
//        "type": "vk"
//        },
//        "comments": {
//        "count": 0,
//        "can_post": 1,
//        "groups_can_post": true
//        },
//        "likes": {
//        "count": 8,
//        "user_likes": 0,
//        "can_like": 1,
//        "can_publish": 1
//        },
//        "reposts": {
//        "count": 0,
//        "user_reposted": 0
//        },
//        "views": {
//        "count": 363
//        }
//        },
//        {
//        "id": 896,
//        "from_id": 163601900,
//        "owner_id": 163601900,
//        "date": 1528231926,
//        "post_type": "post",
//        "text": "",
//        "can_delete": 1,
//        "can_pin": 1,
//        "can_archive": true,
//        "is_archived": false,
//        "attachments": [
//        {
//        "type": "photo",
//        "photo": {
//        "id": 456241789,
//        "album_id": -7,
//        "owner_id": 163601900,
//        "photo_75": "https://pp.userapi.com/c845323/v845323710/73416/O76ztoPVzII.jpg",
//        "photo_130": "https://pp.userapi.com/c845323/v845323710/73417/vPDmuSl2JjY.jpg",
//        "photo_604": "https://pp.userapi.com/c845323/v845323710/73418/GwVodhwuk6I.jpg",
//        "photo_807": "https://pp.userapi.com/c845323/v845323710/73419/VKcie6ff8U8.jpg",
//        "photo_1280": "https://pp.userapi.com/c845323/v845323710/7341a/3aH7KK_1NBU.jpg",
//        "width": 959,
//        "height": 539,
//        "text": "",
//        "date": 1528231881,
//        "access_key": "25bad3d48329aff426"
//        }
//        },
//        {
//        "type": "audio",
//        "audio": {
//        "id": 456241886,
//        "owner_id": 2000214228,
//        "artist": "Sam Smith",
//        "title": "Baby, You Make Me Crazy",
//        "duration": 25,
//        "date": 1528232103,
//        "url": "https://vk.com/mp3/audio_api_unavailable.mp3",
//        "is_hq": true
//        }
//        }
//        ],
//        "post_source": {
//        "type": "api",
//        "platform": "iphone"
//        },
//        "comments": {
//        "count": 0,
//        "can_post": 1,
//        "groups_can_post": true
//        },
//        "likes": {
//        "count": 8,
//        "user_likes": 0,
//        "can_like": 1,
//        "can_publish": 1
//        },
//        "reposts": {
//        "count": 0,
//        "user_reposted": 0
//        },
//        "views": {
//        "count": 339
//        }
//        }
//        ]
//    }
//}
