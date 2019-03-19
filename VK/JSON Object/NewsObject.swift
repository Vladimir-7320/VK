//
//  NewsObject.swift
//  VK
//
//  Created by Владимир Харитонов on 25.06.2020.
//  Copyright © 2020 Mediasoft. All rights reserved.
//
import SwiftyJSON

struct NewsObject {
    var items: [NewsObjectItems]
    var profiles: [NewsObjectProfiles]
    var groups: [NewsObjectGroups]
}

class NewsObjectItems {
    var source_id: Int = 0
    var date: Int = 0
    var text: String = ""
    var commentsCount: Int = 0
    var likesCount: Int = 0
    var likesUser: Int = 0
    var repostsCount: Int = 0
    var repostsUser: Int = 0
    var viewsCount: Int = 0
    var photoUrlFirst: String = ""
    
    convenience init (json: JSON) {
        self.init()
        
        if let source_id = json["source_id"].int {
            self.source_id = source_id
        }
        if let date = json["date"].int {
            self.date = date
        }
        if let text = json["text"].string {
            self.text = text
        }
        if let likesCount = json["likes"]["count"].int {
            self.likesCount = likesCount
        }
        if let likesUser = json["likes"]["user_likes"].int {
            self.likesUser = likesUser
        }
        if let commentsCount = json["comments"]["count"].int {
            self.commentsCount = commentsCount
        }
        if let repostsCount = json["reposts"]["count"].int {
            self.repostsCount = repostsCount
        }
        if let repostsUser = json["reposts"]["user_reposted"].int {
            self.repostsUser = repostsUser
        }
        if let viewsCount = json["views"]["count"].int {
            self.viewsCount = viewsCount
        }
        if let photoUrlFirst = json["attachments"][0]["photo"]["photo_1280"].string {
            self.photoUrlFirst = photoUrlFirst
        }
    }
}

class NewsObjectProfiles {
    var id: Int = 0
    var first_name: String = ""
    var last_name: String = ""
    var photo_50: String = ""
    
    
    convenience init (json: JSON) {
        self.init()
        
        if let id = json["id"].int {
            self.id = id
        }
        if let first_name = json["first_name"].string {
            self.first_name = first_name
        }
        if let last_name = json["last_name"].string {
            self.last_name = last_name
        }
        if let photo_50 = json["photo_50"].string {
            self.photo_50 = photo_50
        }
    }
}

class NewsObjectGroups {
    var id: Int = 0
    var name: String = ""
    var photo_50: String = ""
    
    convenience init (json: JSON) {
        self.init()
        
        if let id = json["id"].int {
            self.id = id
        }
        if let name = json["name"].string {
            self.name = name
        }
        if let photo_50 = json["photo_50"].string {
            self.photo_50 = photo_50
        }
    }
}

/*
{
    "response": {
        "items": [],
        "profiles": [],
        "groups": []
    }
}
*/

//-------------------------------------------------------------------------------------------

/*
{
"response": {
    "items": [
        {
            "can_doubt_category": false,
            "can_set_category": false,
            "type": "post",
            "source_id": -43001537,
            "date": 1593187888,
            "post_type": "post",
            "text": "✅ Промокод на 4 или 1 месяц подписки Apple Music за 25 ₽ 🙀\n\n❗Количество ограничено! Поспешите!\n\n👉🏻 https://appleinside.online/digiseller/articles/101863\n\n⚠ ОБЯЗАТЕЛЬНО ЧИТАЙ ОПИСАНИЕ ТОВАРА НА СТРАНИЦЕ ТОВАРА ПЕРЕД ПОКУПКОЙ !!!",
            "marked_as_ads": 0,
            "attachments": [
                {
                    "type": "photo",
                    "photo": {
                        "album_id": -7,
                        "date": 1593187888,
                        "id": 457433674,
                        "owner_id": -43001537,
                        "has_tags": false,
                        "access_key": "7f912c4331b07b3aa1",
                        "post_id": 774553,
                        "sizes": [
                            {
                                "height": 78,
                                "url": "https://sun9-66.userapi.com/weOB8D5CwxhA3TV7IjcqAV6pTq-Aj_oRhfMX6A/ZhvcMSliOEM.jpg",
                                "type": "m",
                                "width": 130
                            }
                        ],
                        "text": "",
                        "user_id": 100
                    }
                },
                {
                    "type": "link",
                    "link": {
                        "url": "https://appleinside.online/digiseller/articles/101863",
                        "title": "Промокоды",
                        "description": "Магазин Цифровых Товаров - аккаунты, ключи и тд.",
                        "target": "internal",
                        "photo": {
                            "album_id": -26,
                            "date": 1593187888,
                            "id": 457299578,
                            "owner_id": 2000058082,
                            "has_tags": false,
                            "sizes": [
                                {
                                    "height": 42,
                                    "url": "https://sun9-45.userapi.com/diqA2zlDcHYyUcZGRYWfuUn_AjZtprypZbt_1A/3MLNCuUfeTo.jpg",
                                    "type": "m",
                                    "width": 130
                                }
                            ],
                            "text": ""
                        },
                        "is_favorite": false
                    }
                }
            ],
            "post_source": {
                "type": "vk"
            },
            "comments": {
                "count": 0,
                "can_post": 0
            },
            "likes": {
                "count": 3,
                "user_likes": 0,
                "can_like": 1,
                "can_publish": 1
            },
            "reposts": {
                "count": 0,
                "user_reposted": 0
            },
            "views": {
                "count": 871
            },
            "is_favorite": false,
            "post_id": 774553
        },
*/

//-------------------------------------------------------------------------------------------

/*
"profiles": [
    {
        "id": 100,
        "first_name": "Администрация ВКонтакте",
        "last_name": "",
        "is_closed": false,
        "can_access_closed": true,
        "sex": 1,
        "screen_name": "id100",
        "photo_50": "https://sun9-42.userapi.com/c847124/v847124728/335fb/C4CxibtpFzY.jpg?ava=1",
        "photo_100": "https://sun9-50.userapi.com/c847124/v847124728/335fa/43UZSEHZlt4.jpg?ava=1",
        "online": 0,
        "online_info": {
            "visible": true
        }
    },
    {
        "id": 597244185,
        "first_name": "Алексей",
        "last_name": "Черкашин",
        "is_closed": false,
        "can_access_closed": true,
        "sex": 2,
        "screen_name": "id597244185",
        "photo_50": "https://sun9-68.userapi.com/_EJfbGPMGF0YyNuyFgv0pGPrvZPDkbGR4T5ixA/Q8dDl-fceEc.jpg?ava=1",
        "photo_100": "https://sun9-6.userapi.com/xaVJa_ObRbZxc3HOxUa60MIhhkUoNXhoGP1JdA/tHOGYjIUbaI.jpg?ava=1",
        "online": 1,
        "online_app": 2685278,
        "online_mobile": 1,
        "online_info": {
            "visible": true,
            "last_seen": 1593244555,
            "is_online": true,
            "app_id": 2685278,
            "is_mobile": true
        }
    }
],
*/

//-------------------------------------------------------------------------------------------

/*
"groups": [
    {
        "id": 43001537,
        "name": "Apple | iPhone | iPad",
        "screen_name": "apple.inside",
        "is_closed": 0,
        "type": "page",
        "photo_50": "https://sun9-67.userapi.com/c855328/v855328079/d9f63/we5d1A6k6Xc.jpg?ava=1",
        "photo_100": "https://sun9-52.userapi.com/c855328/v855328079/d9f62/jmcmQn_jC4A.jpg?ava=1",
        "photo_200": "https://sun9-26.userapi.com/c855328/v855328079/d9f61/rgprabkMhmk.jpg?ava=1"
    },
    {
        "id": 79157317,
        "name": "БонЛайн | Двери  | Мебель | Окна | Ульяновск",
        "screen_name": "dveriplusmebel",
        "is_closed": 0,
        "type": "group",
        "photo_50": "https://sun9-17.userapi.com/c855724/v855724552/2d5eb/nSbfglDZL8s.jpg?ava=1",
        "photo_100": "https://sun9-32.userapi.com/c855724/v855724552/2d5ea/B6dfXtEcW50.jpg?ava=1",
        "photo_200": "https://sun9-27.userapi.com/c855724/v855724552/2d5e9/GpISzS_XQyo.jpg?ava=1"
    }
],
*/
