//
//  HeaderViewController.swift
//  Aula 4 - TableView
//
//  Created by brunotrassante on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class HeaderViewController: UITableViewCell {
    
    class var nameOfHeaderCell : String {
        get {
            return "header-cell"
        }
    }
    
    @IBOutlet weak var headerMainLabel: UILabel!
    
    func changeText(text : String){
        
        self.headerMainLabel.text = text
    }

}
