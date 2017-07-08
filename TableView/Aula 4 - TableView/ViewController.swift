//
//  ViewController.swift
//  Aula 4 - TableView
//
//  Created by brunotrassante on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var sectionsFull = Dictionary<String,[String]>()
    var sectionsToShow = Dictionary<String,[String]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sectionsFull = ["Mulheres": mulheres, "Rapazes":rapazes,"Etc e Tal": etcetal, "Eletronicos":infoeeletro, "Casa": casa]
        
        for keyArray in sectionsFull
        {
            self.sectionsToShow.updateValue(Array(keyArray.value.prefix(3)), forKey: keyArray.key)
        }
    }
    
    let mulheres = [ "tênis", "blusas", "camisetas", "casaquinhos", "ombro", "short", "calças", "mochila", "relógios", "vestidos", "de mão", "camisas", "chapeu", "saias", "sandálias", "sapatos", "sapatilha", "óculos", "macacão", "perfume", "rasteirinha", "coletes", "clutches", "botas", "cintos", "cabelos", "carteiras", "meia-calça", "bijoux", "cosméticos", "maquiagem", "necessaire", "ternos", "vestidos de festa", "esportes", "outros", "praia", "lingerie"]
    
    let rapazes = [ "tênis", "camisetas", "camisas", "casacos", "bonés", "bermudas", "calças", "relógios", "bolsas", "sandálias", "óculos", "sapatos", "perfumes", "blazer", "lenços", "botas", "carteiras", "chapeu", "coletes", "esportes", "outros", "praia", "kids", "pezinho de menino", "roupas de menino", "roupas de menina", "pezinho de menina", "pezinho de bebê", "roupas de bebê", "brinquedos de crescidinhos", "outros"]
    
    let etcetal = [ "outros", "esportes e outdoor", "malas", "vintage e retrô", "pets"]
    
    let infoeeletro = [ "outros", "iphone", "outros", "outros celulares", "outros"]
    
    let casa = [ "decoração"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func viewMoreClick(_ sender: UIButton) {
        let sectionTag = sender.tag
        let key = Array(sectionsToShow.keys)[sectionTag]
        
        self.sectionsToShow.updateValue(self.sectionsFull[key]!, forKey: key)
        
//        tableView.reloadSections([sectionTag], with: UITableViewRowAnimation.none)
        tableView.reloadData()
    }
    
    
    // MARK: Datasource
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionsToShow.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RowViewController.nameOfRowCell) as! RowViewController
        
        let key = Array(sectionsToShow.keys)[indexPath.section]
        let array = sectionsToShow[key]
        let value = array?[indexPath.item]
        
        cell.changeText(text: value!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FooterViewController.nameOfCell) as! FooterViewController
        cell.addTagToButton(tag: section)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderViewController.nameOfHeaderCell) as! HeaderViewController
        let key = Array(sectionsToShow.keys)[section]
        cell.changeText(text: key)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(sectionsToShow.keys)[section]
        let array = sectionsToShow[key]
        
        var numberOfLines : Int
        
        numberOfLines = (array?.count)!
        
        return numberOfLines
    }
    
    // MARK: Delegate
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //    }
    
    
}

