//
//  ViewController.swift
//  ClientAPI
//
//  Created by brunotrassante on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loaderItem.isHidden = true
        self.loaderItem.hidesWhenStopped = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var people : People?
    
    @IBOutlet weak var loaderItem: UIActivityIndicatorView!
    @IBAction func callAPI(_ sender: UIButton) {
        self.loaderItem.startAnimating()
        People.getPeople(id: 1) { (people, error) in
            if(error == 0){
                self.people = people
            }
            self.loaderItem.stopAnimating()
        }
    }
}

