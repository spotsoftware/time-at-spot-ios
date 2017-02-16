//
//  UserModel.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 16/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

import ObjectMapper

class UserModel: Mappable {

    var _id:String?
    
    var active = true
    
    var deleted = false
    
    var name:String!
    
    var email:String!
    
    var provider:String!
    
    var role:String!

    public required init?(map: Map){
        
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
