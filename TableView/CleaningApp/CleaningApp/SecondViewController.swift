//
//  SecondViewController.swift
//  CleaningApp
//
//  Created by brunotrassante on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextStep(_ sender: Any) {
        let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "thirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(thirdViewController, animated: true)
        
    }
    
}
