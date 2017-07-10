//
//  People.swift
//  starWarsApp
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//


import Foundation

class People  {
    
    var name: String
    var birthYear:String
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.birthYear = json["birth_year"] as! String
    }
    
    // TODO: Remover para uma classe especifica
    static func getPeople(id: Int, completion: @escaping (_ people : People?,_ error : Int)-> Void )  {
        Network.load(url: "people/\(id)", method: .get){(json, error) in
            if error == 0 {
                completion(People(json: json),error)
            }
            else{
                completion(nil, error)
            }
        }
    }
    
    static func searchPeople(name: String, completion: @escaping (_ peopleArray : [People]?,_ error : Int)-> Void )  {
        Network.load(url: "people/?search=\(name)", method: .get){(json, error) in
            if error == 0 {
                
                var peopleArray = [People]()
                
                if let peopleJson = json["results"] as? [JSON]{
                    for people in peopleJson{
                        peopleArray.append(People(json: people))
                    }
                    
                    completion(peopleArray,error)
                }
                else{
                    completion(nil, 2)

                }
                
            }
            else{
                completion(nil, error)
            }
        }
    }
}
