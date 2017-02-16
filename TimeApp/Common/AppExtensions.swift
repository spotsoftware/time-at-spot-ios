//
//  AppExtensions.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit
import MyEnvironmentConfig

extension MYEnvironmentConfig {
    
    func getServicesBaseUrl() -> String {
        return configValue(forKey: "services.baseURL") as! String
    }
    
}
