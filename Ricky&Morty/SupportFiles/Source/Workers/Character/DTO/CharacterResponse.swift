//
//  CharacterResponse.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 15/03/21.
//

import Foundation

struct CharacterResponse: Decodable {
    
    let info: CharacterInfo
    
    let results: [Character]
}

struct CharacterInfo: Decodable {
    
    let count: Int
    
    let pages: Int
    
    let next: String?
    
    let prev: String?
}
