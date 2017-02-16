//
//  ViewController.swift
//  TimeApp
//
//  Created by Luca Giorgetti on 31/01/17.
//  Copyright © 2017 SPOT Software. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: Initializers
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.performSegue(withIdentifier: Constants.SegueIds.toLogin, sender: nil)
    }

}

