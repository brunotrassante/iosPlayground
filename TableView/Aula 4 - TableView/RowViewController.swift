//
//  RowViewController.swift
//  Aula 4 - TableView
//
//  Created by brunotrassante on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class RowViewController: UITableViewCell {
    
    class var nameOfRowCell : String {
        get {
            return "row-cell"
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    func changeText(text : String){
        
       self.label.text = text
    }
}
