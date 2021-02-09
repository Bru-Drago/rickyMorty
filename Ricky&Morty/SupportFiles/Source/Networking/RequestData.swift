//
//  RequestData.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 08/02/21.
//

import Alamofire

struct RequestData {
    
    var url: String
    
    var method: HTTPMethod
    
}

class DefaultDecoder<T: Decodable> {
    
    // MARK: - Internal properties
    
    internal let expectedType: T.Type
    
    // MARK: - Inits
    
    init(for type: T.Type) {
        self.expectedType = type
    }
    
    // MARK: - Public Functions
    
    func decode(from data: Data) -> T? {
        return try? JSONDecoder().decode(expectedType.self, from: data)
    }
}
