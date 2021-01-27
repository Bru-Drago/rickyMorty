//
//  DefaultDecoder.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 26/01/21.
//

import Foundation

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
