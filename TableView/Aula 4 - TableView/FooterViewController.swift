//
//  ViewMoreCell.swift
//  Aula 4 - TableView
//
//  Created by brunotrassante on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class FooterViewController: UITableViewCell {
    
    @IBOutlet weak var viewMoreButton: UIButton!
    
    func addTagToButton(tag : Int)  {
        self.viewMoreButton.tag = tag
    }
    
    class var nameOfCell : String {
        get {
            return "footer-cell"
        }
    }
}
