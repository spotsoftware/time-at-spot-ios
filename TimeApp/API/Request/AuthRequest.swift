//
//  AuthRequest.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

class AuthRequest: NSObject {

    private var id_token:String!
    
    func getIdToken () -> String {
        return self.id_token
        
    }
    
    func setIdToken (id_token:String) -> AuthRequest {
        self.id_token = id_token
        return self
    }
}
