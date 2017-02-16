//
//  ServiceProtocols.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

import Alamofire
import AlamofireObjectMapper
import MyEnvironmentConfig

class AuthService {
    
    func auth (request:AuthRequest, completion:@escaping (_ user:User?, _ cookie:String?, _ error:Error?) -> ()) {

        let url = MYEnvironmentConfig.shared().getServicesBaseUrl() + Constants.Services.Auth.validate
        let parameters:Parameters = ["id_token" : request.getIdToken()]
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<User>) in
            if let cookie = response.response?.allHeaderFields["Set-Cookie"] as? String, let user = response.result.value {
                Datastorage.sharedInstance.updateCookie(cookie: cookie)
                Datastorage.sharedInstance.saveTimeUser(user: user)
                completion(user, cookie, nil)
            }
            else {
                completion(nil, nil, response.error)
            }
        }
    }
    
    func logout (completion:@escaping () -> ()) {
        let url = MYEnvironmentConfig.shared().getServicesBaseUrl() + Constants.Services.Auth.logout
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
                LoginManager.sharedInstance.googleLogout()
            }
            
            completion()
        }
    }
}
