//
//  Network.swift
//  starWarsApp
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//


import Foundation
import Alamofire

typealias JSON = Dictionary<String,Any>

class Network {
    
    static let baseURL = "https://swapi.co/api/"
    
    class func load(url: String, method: HTTPMethod = .get, completion: @escaping (_ json: JSON, _ error: RequestResult) -> Void) {
        if Reachability.isConnectedToNetwork() {
            Alamofire.request(Network.baseURL + url, method: method).responseJSON { (response) in
                if response.isSuccess {
                    if let json = response.result.value as? JSON {
                        completion(json, .success)
                    }
                }
                else {
                    completion([:], .unknownError)
                }
            }
        }
        else {
            completion([:], .noInternet) 
        }
    }
}
