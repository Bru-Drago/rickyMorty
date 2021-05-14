//
//  Character.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 15/03/21.
//

import Foundation

struct Character: Decodable {
    
    let id: Int
    
    let name: String
    
    let status: String
    
    let species: String
    
    let image: String
    
    enum CodingKeys: CodingKey {
        case id, name, status, species, image
    }
}
