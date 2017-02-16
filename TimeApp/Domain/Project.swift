//
//  Project.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

import RealmSwift

class Project: Object {

    dynamic var projectId:String!
    
    dynamic var name:String!
    
    let amount = Double()
    
    dynamic var icon:String?
    
    dynamic var initials:String!
    
    dynamic var group:String?
    
    dynamic var active:Bool = true
    
    override static func primaryKey () -> String? {
        return "projectId"
    }
}
