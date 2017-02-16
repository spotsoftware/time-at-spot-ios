//
//  Constants.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

class Constants: NSObject {
    
    struct Notifications {
        
        static let onLoginSuccess = "kOnLoginSuccess"
    }
    
    struct SegueIds {
        
        static let toLogin = "segueToLogin"
    }
    
    struct  Services {
        
        struct Auth {
            
            static let serverClientId = "328110632119-votutohgtdhcb7qlao6t07vn0njcfu7s.apps.googleusercontent.com"
            
            static let validate = "api/session/google/validate"
            
            static let logout = "api/session"
        }
    }
}
