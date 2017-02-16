//
//  Member.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

import RealmSwift

class Member: Object {

    dynamic var memberId:String!
    
    dynamic var user:String!
    
    dynamic var role:String!
    
    override static func primaryKey() -> String? {
        return "memberId"
    }
}
