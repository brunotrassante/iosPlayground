//
//  PErson.swift
//  ClientAPI
//
//  Created by brunotrassante on 08/07/17.
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
}
