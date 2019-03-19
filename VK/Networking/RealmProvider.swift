//
//  RealmProvider.swift
//  VK
//
//  Created by Владимир Харитонов on 30.05.2020.
//  Copyright © 2020 Mediasoft. All rights reserved.
//

import Foundation
import RealmSwift

class RealmProvider {
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: false)

    static func save<T: Object>(items: [T],
        configuration: Realm.Configuration = deleteIfMigration,
        update: Realm.UpdatePolicy = .modified) throws {
        let realm = try Realm(configuration: configuration)
        print(configuration.fileURL!)
        try realm.write {
            realm.add(items, update: update)
        }
    }
    
    static func get<T: Object>(_ type: T.Type,
        configuration: Realm.Configuration = deleteIfMigration) throws -> Results<T> {
        let realm = try Realm(configuration: configuration)
        return realm.objects(type)
    }
}


