//
//  People.swift
//  starWarsApp
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//


import Foundation

// TODO: Refatorar para seprar api de classe de dominio
class PeopleAPI  {
    
    var name: String
    var hairColor:String
    var height:String
    var mass:String
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.hairColor = json["hair_color"] as! String
        self.height = json["height"] as! String
        self.mass = json["mass"] as! String
    }
    
    init(name:String, hairColor:String, mass:String, height: String) {
        self.name = name
        self.hairColor = hairColor
        self.height = height
        self.mass = mass
    }
    
    static func getPeople(id: Int, completion: @escaping (_ people : PeopleAPI?,_ requestResult : RequestResult)-> Void )  {
        Network.load(url: "people/\(id)", method: .get){(json, requestResult) in
            if requestResult == .success{
                completion(PeopleAPI(json: json),requestResult)
            }
            else{
                completion(nil, requestResult)
            }
        }
    }
    
    static func searchPeople(name: String, completion: @escaping (_ peopleArray : [PeopleAPI]?,_ requestResult : RequestResult)-> Void )  {
        Network.load(url: "people/?search=\(name)", method: .get){(json, requestResult) in
            let peopleStorage = PeopleStorage()
            var peopleArray = [PeopleAPI]()
            
            if requestResult == .success {
                
                if let listPeopleJson = json["results"] as? [JSON]{
                
                    for peopleJSON in listPeopleJson{
                        let people = PeopleAPI(json: peopleJSON)
                        self.storeIfDoesNotExists(people: people, peopleStorage: peopleStorage)
                        peopleArray.append(people)
                    }
                    
                    completion(peopleArray,requestResult)
                }
                else{
                    completion(nil, .unknownError)
                    
                }
            }
            else{
                if let peopleFromStorage = peopleStorage.get(withPredicate: NSPredicate(format: "name contains[c] %@", name)){
                    for peopleStored in peopleFromStorage{
                        let people = PeopleAPI(name: peopleStored.name!,hairColor: peopleStored.hairColor!,mass:String(peopleStored.mass), height: String(describing: peopleStored.height))
                        peopleArray.append(people)
                    }
                     completion(peopleArray, requestResult)
                }
                else{
                    completion(nil, requestResult)
                }
            }
        }
    }
    
    static func storeIfDoesNotExists(people: PeopleAPI, peopleStorage: PeopleStorage) {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true

       if peopleStorage.get(withPredicate: NSPredicate(format: "name = %@", people.name))?.count == 0 {
            peopleStorage.create(name: people.name, height: formatter.number(from:people.height) as! NSDecimalNumber, mass: formatter.number(from:people.mass) as! Int16, hairColor: people.hairColor)
        }
    }
}
