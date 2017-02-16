//
//  User.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

import RealmSwift
import ObjectMapper

class User: Object, Mappable {

    dynamic var _id:String?
    
    dynamic var active = true
    
    dynamic var deleted = false
    
    dynamic var name:String!
    
    dynamic var email:String!
    
    dynamic var provider:String!
    
    dynamic var role:String!
    
    override static func primaryKey () -> String? {
        return "_id"
    }
    
    required convenience init?(map: Map){
        self.init()
    }
    
    public func mapping(map: Map) {
        _id	<- map["_id"]
        active	<- map["active"]
        deleted	<- map["deleted"]
        name	<- map["name"]
        email	<- map["email"]
        provider	<- map["provider"]
        role	<- map["role"]
    }
}
