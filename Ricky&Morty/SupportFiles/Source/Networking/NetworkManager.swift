//
//  NetworkManager.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 15/03/21.
//

import Alamofire

protocol NetworkManagerProtocol {
    
}

class NetworkManager: NetworkManagerProtocol {
    
    static func request(url: String, completionHandler: @escaping ([Character]) -> Void) {
     
        let request = AF.request(url, method: .get)
        
        request.validate().responseJSON { response in
            switch response.result {
            case.success:
                let data = response.data ?? Data()
                let response = try? JSONDecoder().decode(CharacterResponse.self, from: data)
                completionHandler(response?.results ?? [])
            case.failure(let error):
                print(error)
            }
        }
        
    }
}
