//
//  Character.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 26/01/21.
//

import Foundation

struct Character: Decodable {
    
    // MARK: - Decodable Properties

    let results: [Results]
}

struct Results: Decodable {
    
    // MARK: - Decodable Properties
    
    let name: String
    
    let status: String
    
    let species: String
    
    let type: String
    
    let gender: String
    
    let origin: [Origin]
    
    let location: [Location]
    
    let image: String
    
    let episode: [String]
}

struct Origin: Decodable {
    
    // MARK: - Decodable Properties
    
    let name: String
}

struct Location: Decodable {
    
    // MARK: - Decodable Properties
    
    let name: String
}
