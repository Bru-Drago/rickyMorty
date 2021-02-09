//
//  CharacterListWorker.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 08/02/21.
//

import Alamofire

typealias SuccessResponse = (_ response: Character?) -> Void
typealias FailureResponse = (_ error: AFError?) -> Void

class CharacterListWorker {
    
    func fetchCharacters(page: Int,
                         success: @escaping SuccessResponse,
                         failure: @escaping FailureResponse) {
        
        let baseUrl = "https://rickandmortyapi.com/api"
        let characterEndpoint = "/character"
        let url = baseUrl + characterEndpoint
        let decoder = DefaultDecoder(for: Character.self)
        let request = RequestData(url: url, method: .get)
        
        NetworkManager.request(data: request,
                               decoder: decoder,
                               success: { response in
                                success(response)
                               },
                               failure: { error in
                                failure(error)
                               })
    }
}
//let locationEndpoint = "/location"
//let episodeEndpoint = "/episode"
