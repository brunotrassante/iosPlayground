//
//  Network.swift
//  ClientAPI
//
//  Created by brunotrassante on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = Dictionary<String,Any>

class Network {
    
    static let baseURL = "https://swapi.co/api/"
    
    class func load(url: String, method: HTTPMethod, completion: @escaping(_ json: JSON,_ error: Int) -> Void){
        
        Alamofire.request(Network.baseURL + url, method: method).responseJSON{ (response) in
            if let json = response.result.value as? JSON {
                completion(json,0)
            }
        }
    }
}
