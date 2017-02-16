//
//  LoginVC.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

import GoogleSignIn

class LoginVC: UIViewController, GIDSignInUIDelegate {

    //MARK: Outlets
    
    @IBOutlet weak var btnLoginWithGoogle: GIDSignInButton!
    //MARK: Variables
    
    //MARK: Initializers

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onLoginSuccess), name: NSNotification.Name(rawValue: Constants.Notifications.onLoginSuccess), object: nil)
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    func onLoginSuccess () {
        let cookie = Datastorage.sharedInstance.getCookie()
        let user = Datastorage.sharedInstance.getTimeUser()
        let i = 0
    }
}
