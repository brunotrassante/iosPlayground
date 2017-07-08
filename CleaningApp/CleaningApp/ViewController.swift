//
//  ViewController.swift
//  CleaningApp
//
//  Created by brunotrassante on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextStep(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! SecondViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }

}

