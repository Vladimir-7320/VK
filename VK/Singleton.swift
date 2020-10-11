//
//  VKSession.swift
//  VK
//
//  Created by Владимир on 16/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import Foundation

class Singleton {
    static let instance = Singleton()
    private init(){}
    
    // Current user
    var userId = ""
    var clientId = ""
    var token = ""
    
    // General parameters
    let version = 5.68
    var profileGU = Profile()
}
