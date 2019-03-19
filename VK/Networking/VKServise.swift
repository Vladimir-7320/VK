//
//  VKLoginController.swift
//  VK
//
//  Created by Владимир on 15/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON
import RealmSwift

struct Response: Decodable {
    let response: JSON
}

class VKService: UIViewController {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    let versionRequest = 5.68
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Передаем значения в Singltone VKSession
        let session = Singltone.instance
        session.clientId = "6954809"

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: session.clientId),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "8198" ),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "\(versionRequest)")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
}

extension VKService: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        guard let token = params["access_token"] else {
            decisionHandler(.cancel)
            return
        }
        
        guard let userId = params["user_id"] else { return }

        // Передаем значения в Singltone VKSession
        let session = Singltone.instance
        session.token = token
        session.userId = userId
        
        print("\n My token: \n\(session.token)")
        print("\n My userId: \n\(session.userId)\n")
        
        performSegue(withIdentifier: "VKLogin", sender: nil)
        decisionHandler(.cancel)
        
    }
    
  
  
    // Получение данных для ленты новостей
    func loadNews(completion: ((NewsObject?, Error?) -> Void)? = nil) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/newsfeed.get"

        let params: Parameters = [
            "filters" : "post, photo",
            "count" : 30,
            "access_token" : Singltone.instance.token,
            "v" : versionRequest
        ]

        AF.request(baseUrl+path, method: .get, parameters: params).responseJSON(queue: .global(qos: .utility)) { respondse in
            switch respondse.result {
                case let .success(value):
                    let json = JSON(value)
                    
                    var newsItem = [NewsObjectItems]()
                    var groups = [NewsObjectGroups]()
                    var profiles = [NewsObjectProfiles]()
                    
                    let jsonParseGroup = DispatchGroup()
                    
                    DispatchQueue.global().async(group: jsonParseGroup) {
                        newsItem = json["response"]["items"].arrayValue.map { NewsObjectItems(json: $0) }
                    }
                    
                    DispatchQueue.global().async(group: jsonParseGroup) {
                        groups = json["response"]["groups"].arrayValue.map { NewsObjectGroups(json: $0) }
                    }
                    
                    DispatchQueue.global().async(group: jsonParseGroup) {
                        profiles = json["response"]["profiles"].arrayValue.map { NewsObjectProfiles(json: $0) }
                    }
                    
                    jsonParseGroup.notify(queue: DispatchQueue.main) {
                        let news = NewsObject(items: newsItem, profiles: profiles, groups: groups)
                        completion?(news, nil)
                    }
                    
                case let .failure(error):
                    completion?(nil, error)
            }
        }
    }
    
    // Получение информации о текущем пользователе
    func loadProfile() {
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/users.get"
        
        let params: Parameters = [
            "access_token" : Singltone.instance.token,
            "fields" : "sex, bdate, city, country, home_town, photo_50, photo_100, photo_200_orig, photo_200, photo_400_orig, photo_max, photo_max_orig, online, domain",
            "v" : versionRequest
        ]
        
        AF.request(baseUrl+path, method: .get, parameters: params).responseJSON { responds in
            guard let data = responds.data else { return }
            
            do {
                let responstData = try JSONDecoder().decode(Response.self, from: data)
                let dataProfile = Profile(json: responstData.response)

                print("\nТекущий пользователь: \(dataProfile.first_name) \(dataProfile.last_name)")
                
                Singltone.instance.profileGU = dataProfile
                
            } catch {
                print("error")
            }
        }
    }
    
    // Получение информации о записях текущего пользователя
    func loadProfilePost() {
        let baseUrl = "https://api.vk.com"
        let path = "/method/wall.get"
        
        let params: Parameters = [
            "access_token" : Singltone.instance.token,
            "count" : "100",
            "v" : versionRequest
        ]
        
        AF.request(baseUrl+path, method: .get, parameters: params).responseJSON { responds in guard let data = responds.data else { return }
            
            do {
                let responstData = try JSONDecoder().decode(Response.self, from: data)
                let dataProfile = Profile(json: responstData.response)
                
                print("\nРаспечатка JSON ответа данных о текущем пользователе\n\(responstData.response)")
                
                Singltone.instance.profileGU = dataProfile
                
            } catch {
                print("error")
            }
        }
    }
    
    // Получения списка друзей текущего пользователя
    func loadFriends(completion: @escaping ([FriendObject]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"

        let params: Parameters = [
            "access_token" : Singltone.instance.token,
            "fields" : "domain, bdate, city, country, photo_50, photo_100, photo_200_orig, online",
            "v" : versionRequest
        ]

        AF.request(baseUrl+path, method: .get, parameters: params).responseJSON { responds in
            guard let data = responds.data else { return }
            
            do {
                let responstData = try JSONDecoder().decode(Response.self, from: data)
                let dataFriends = Friends(json: responstData.response)
                
                var friendsArray = [FriendObject]()
                
                for item in dataFriends.friends {
                    let friend = FriendObject(json: item)
                    friendsArray.append(friend)
                }
                
                print("\nКоличество друзей \(friendsArray.count)")
                completion(friendsArray)
                
            } catch {
                print("error")
            }
        }
    }
    
    // Получение фото по id человека
    func loadFriendsPhoto(friendsId: Int, completion: @escaping ([FriendsPhotoObject]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.getAll"
        
        //let someFriendsPhoto = FriendsPhotoViewController()
        
        let params: Parameters = [
            "access_token" : Singltone.instance.token,
            "owner_id" : friendsId,
            "v" : versionRequest
        ]
        
        //print(friendsId)
        
        AF.request(baseUrl+path, method: .get, parameters: params).responseJSON { responds in
            //print(responds.value as Any)
            guard let data = responds.data else { return }
            
            do {
                let responstData = try JSONDecoder().decode(Response.self, from: data)
                let dataFriends = FriendsPhoto(json: responstData.response)
                
                var friendsArray = [FriendsPhotoObject]()
                
                for item in dataFriends.friendsPhoto {
                    let friendPhoto = FriendsPhotoObject(json: item)
                    friendsArray.append(friendPhoto)
                }
                
                completion(friendsArray)
                
            } catch {
                print("error")
            }
        }
    }
    
    // Получения списка фотографий текущего пользователя
    func loadPhotos(completion: @escaping ([PhotoObject]) -> Void) {

        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.get"

        let params: Parameters = [
            "access_token" : Singltone.instance.token,
            "album_id" : "wall",
            "v" : versionRequest
        ]

        AF.request(baseUrl+path, method: .get, parameters: params).responseJSON { responds in
            guard let data = responds.data else { return }
            
            do {
                let responstData = try JSONDecoder().decode(Response.self, from: data)
                let dataPhotos = Photo(json: responstData.response)
                
                var photosArray = [PhotoObject]()
                
                for item in dataPhotos.photos {
                    let photo = PhotoObject(json: item)
                    photosArray.append(photo)
                }
                
                completion(photosArray)
                
            } catch {
                print("error")
            }
        }
    }

    // Получение групп текущего пользователя
    func loadGroup(completion: @escaping ([GroupObject]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token" : Singltone.instance.token,
            "extended" : 1,
            "v" : versionRequest
        ]
        
        AF.request(baseUrl+path, method: .get, parameters: params).responseJSON { responds in
            guard let data = responds.data else { return }
            
            do {
                let responstData = try JSONDecoder().decode(Response.self, from: data)
                let dataGroups = Group(json: responstData.response)
                
                var groupsArray = [GroupObject]()
                
                for item in dataGroups.groups {
                    let group = GroupObject(json: item)
                    groupsArray.append(group)
                }
                
                completion(groupsArray)
                
            } catch {
                print("error")
            }
        }
    }
    
    
    
}
