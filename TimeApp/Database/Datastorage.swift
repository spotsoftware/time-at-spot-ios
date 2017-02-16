//
//  Datastorage.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 15/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit
import RealmSwift

class Datastorage: NSObject {
    
    //MARK: Constants
    
    static let sharedInstance = Datastorage()

    private let preferencesKey = "Datastorage"
    
    private let kCookie = "kCookie"
    
    //MARK: Initializers
    
    override init() {
        super.init()
        
        let _ = try! Realm.init(configuration:
            Realm.Configuration(fileURL: Realm.Configuration().fileURL!.deletingLastPathComponent().appendingPathComponent("timaatspot.realm"),
                                objectTypes: [
                                    Client.self,
                                    Member.self,
                                    Organization.self,
                                    Project.self,
                                    User.self,
                                    UserSettings.self,
                                    WorkEntry.self
                ]))
    }
    
    // MARK: Realm Configuration
    
    private var realm: Realm {
        get {
            return try! Realm()
        }
    }
    
//    private var realm: Realm {
//        get {
//            return try! Realm(configuration:
//                Realm.Configuration(fileURL: Realm.Configuration().fileURL!.deletingLastPathComponent().appendingPathComponent("timaatspot.realm"),
//                                    objectTypes: [
//                                        Client.self,
//                                        Member.self,
//                                        Organization.self,
//                                        Project.self,
//                                        User.self,
//                                        UserSettings.self,
//                                        WorkEntry.self
//                    ]))
//        }
//    }
    
    // MARK: Preferences
    
    var container: [String : Any] {
        get {
            let preferences = UserDefaults.standard
            guard let dict = preferences.object(forKey: preferencesKey) as? [String: Any] else {
                let newContainer = [String : Any]()
                preferences.set(newContainer, forKey: preferencesKey)
                preferences.synchronize()
                return newContainer
            }
            return dict
        }
        set {
            let preferences = UserDefaults.standard
            preferences.set(newValue, forKey: preferencesKey)
            preferences.synchronize()
        }
    }
    
    //MARK: Public methods
    
    func updateCookie(cookie:String) {
        container[kCookie] = cookie
    }
    
    func getCookie () -> String? {
        return container[kCookie] as? String
    }
    
    func saveTimeUser (user:User) {
        Datastorage.sharedInstance.deleteTimeUser()
        try! realm.write {
            self.realm.add(user)
        }
    }
    
    func deleteTimeUser () {
        let results = realm.objects(User.self)
        try! realm.write {
            self.realm.delete(results)
        }
    }
    
    func getTimeUser () -> User? {
        let users = realm.objects(User.self)
        let count = users.count
        let user = users.first
        return users.first
    }
    
    func clearAll() {
        try! realm.write {
            realm.deleteAll()
        }
        container.removeAll()
    }
}
