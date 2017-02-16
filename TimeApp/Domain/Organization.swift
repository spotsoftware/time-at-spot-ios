//
//  Organization.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

import Realm
import RealmSwift

class Organization: Object {

    dynamic var organizationId:String!
    
    dynamic var name:String!
    
    dynamic var lastImport:String?
    
    dynamic var active:Bool = true
    
    dynamic var deleted:Bool = false
    
    var members = List<Member>()
    
    override static func primaryKey () -> String? {
        return "organizationId"
    }
}
