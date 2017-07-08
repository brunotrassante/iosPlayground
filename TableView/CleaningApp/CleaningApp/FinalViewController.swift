//
//  FinalViewController.swift
//  CleaningApp
//
//  Created by brunotrassante on 05/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    @IBOutlet weak var getLocation: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLocation.layer.cornerRadius = CGFloat(15)
        
        getLocation.layer.borderColor = UIColor(hexString: "#48B3E3").cgColor
        getLocation.layer.borderWidth = 1.5
        getLocation.layer.masksToBounds = true
    }
    
    
}
