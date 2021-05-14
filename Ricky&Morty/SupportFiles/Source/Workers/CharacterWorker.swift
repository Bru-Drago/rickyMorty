//
//  CharacterWorker.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 13/05/21.
//

import Foundation

typealias CharacterListResult = (Result<CharacterResponse, CharacterError>) -> Void

protocol CharacterWorkerProtocol {
    
    func fetchCharacter(completion: @escaping CharacterListResult)
}

class CharacterWorker: CharacterWorkerProtocol {
    
    let url = "https://rickandmortyapi.com/api/character"
    
    func fetchCharacter(completion: @escaping CharacterListResult) {
        NetworkingManager.request(url: url) { result in
            completion(result)
        }
    }
}
