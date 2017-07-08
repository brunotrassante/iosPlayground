//
//  ThirdViewController.swift
//  CleaningApp
//
//  Created by brunotrassante on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextStep(_ sender: Any) {
        let finalViewController = self.storyboard?.instantiateViewController(withIdentifier: "finalViewController") as! FinalViewController
        self.navigationController?.pushViewController(finalViewController, animated: true)
    }
}
