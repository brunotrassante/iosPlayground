//
//  PeopleViewController.swift
//  starWarsApp
//
//  Created by brunotrassante on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
    
    var peopleArray = [People]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchPeople(name: "")
        
        
    }
    //    @IBAction func nextStep(_ sender: Any) {
    //        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! SecondViewController
    //        self.navigationController?.pushViewController(secondViewController, animated: true)
    //    }
    
    func searchPeople(name: String){
        
        errorMessageField.isHidden = true
        
        self.activityIndicator.startAnimating()
        self.peopleArray = []
        
        People.searchPeople(name: name) {(peopleArray, error) in
            if(error == 0){
                self.peopleArray = peopleArray!
                           }
            else if (error == 1){
                self.errorMessageField.isHidden = false
                self.errorMessageField.text = "No Internet Found"
            }
            else{
                self.errorMessageField.isHidden = false
                self.errorMessageField.text = "Unknown Error"
            }
            self.peopleTableView.reloadData()
            self.activityIndicator.stopAnimating()
            
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchPeople(name: textField.text!)
        return true
    }
    
   
    @IBOutlet weak var errorMessageField: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var peopleTableView: UITableView!
    
    
    // MARK: Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PeopleCellViewController.nameOfCell) as! PeopleCellViewController
        
        let name = peopleArray[indexPath.item].name
        
        cell.changeText(text: name)
        
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //
    //        let cell = tableView.dequeueReusableCell(withIdentifier: FooterViewController.nameOfCell) as! FooterViewController
    //        cell.addTagToButton(tag: section)
    //
    //        return cell
    //
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.peopleArray.count
    }
    
    // MARK: Delegate
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //    }
}
