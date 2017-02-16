//
//  WorkEntry.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

import RealmSwift

class WorkEntry: Object {

    dynamic var workEntryId:String!
    
    dynamic var active:Bool = true
    
    dynamic var deleted:Bool = false
    
    dynamic var workEntryDescription:String?
    
    dynamic var performedAt:String?
    
    let amount = Double()
    
    //Linked models
    
    dynamic var client:Client?
    
    dynamic var project:Project?
    
    dynamic var user:User?
    
    dynamic var organization:Organization?
    
    override static func primaryKey () -> String? {
        return "workEntryId"
    }
}
