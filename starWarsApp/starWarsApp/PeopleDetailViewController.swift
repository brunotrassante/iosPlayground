//
//  PeopleDetailViewController.swift
//  starWarsApp
//
//  Created by brunotrassante on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit


class PeopleDetailViewController: UIViewController {
    
    var name = String()
    var hairColor = String()
    var mass = String()
    var heigth = String()
    
    
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    class func peopleDetailInit(name: String,hairColor: String,mass: String,height: String) -> PeopleDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "peopleDetailViewController") as! PeopleDetailViewController
        
        viewController.name = name
        viewController.hairColor = hairColor
        viewController.mass = mass
        viewController.heigth = height
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.massLabel.text = self.mass
        self.nameLabel.text = self.name
        self.heightLabel.text = self.heigth
        self.hairColorLabel.text = self.hairColor
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
