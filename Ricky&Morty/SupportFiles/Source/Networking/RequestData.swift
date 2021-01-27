//
//  RequestData.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 26/01/21.
//

import Foundation

import Alamofire

struct RequestData {
    
    var url: String
    
    var method: HTTPMethod
    
    var encoding: ParameterEncoding
    
    var parameters: [String: Any]?
    
}
