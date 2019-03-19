//
//  VKSession.swift
//  VK
//
//  Created by Владимир on 16/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import Foundation

class Singltone {
    // Класс Singltone в котором хранится вся необходимая информация
    static let instance = Singltone()
    
    private init(){}
    
    // Текущий пользователь
    var userId = ""
    var clientId = ""
    var token = ""
    
    let version = 5.68
    
    var profileGU = Profile()
}
