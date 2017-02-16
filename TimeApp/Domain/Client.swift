//
//  Client.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

import RealmSwift

class Client: Object {

    dynamic var clientId:String!
    
    dynamic var organization:String?
    
    dynamic var initials:String!
    
    dynamic var icon:String?
    
    dynamic var name:String!
    
    dynamic var active:Bool = true
    
    dynamic var deleted:Bool = false
    
    override static func primaryKey() -> String? {
        return "clientId"
    }
}
