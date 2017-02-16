//
//  SigninManager.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 10/02/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

import Google
import GoogleSignIn

class LoginManager: NSObject, GIDSignInDelegate {

    //MARK: Constants
    
    static let sharedInstance = LoginManager()
    
    //MARK: Initializers
    
    override init() {
        super.init()
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func start () {
        GIDSignIn.sharedInstance().serverClientID = Constants.Services.Auth.serverClientId
    }

    //MARK: GIDSignInDelegate
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {

            guard let idToken = user.authentication.idToken else { return } // Safe to send to the server
            self.loginOnTime(googleIdToken: idToken)
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
                // Perform any operations when the user disconnects from app here.
                // ...
    }
    
    func googleLogout () {
        GIDSignIn.sharedInstance().signOut()
    }
    
    //MARK: Login
    
    private func loginOnTime (googleIdToken:String) {
        let request = AuthRequest().setIdToken(id_token: googleIdToken)
        AuthService().auth(request: request) { (user, cookie, error) in
            guard error == nil else {
                //TODO: show error
                return
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.onLoginSuccess), object: nil)
        }
    }
}
