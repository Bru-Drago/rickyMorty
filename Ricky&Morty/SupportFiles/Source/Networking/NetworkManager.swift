//
//  NetworkManager.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 15/03/21.
//

import Alamofire

//protocol NetworkManagerProtocol {
//
//}
//
//class NetworkManager: NetworkManagerProtocol {
//
//    static func request(url: String, completionHandler: @escaping ([Character]) -> Void) {
//
//        let request = AF.request(url, method: .get)
//
//        request.validate().responseJSON { response in
//            switch response.result {
//            case.success:
//                let data = response.data ?? Data()
//                let response = try? JSONDecoder().decode(CharacterResponse.self, from: data)
//                completionHandler(response?.results ?? [])
//            case.failure(let error):
//                print(error)
//            }
//        }
//    }
//}
typealias NetworkResult<T: Decodable> = ((Result<T, CharacterError>) -> Void)

protocol NetworkingManagerProtocol {
    
    static func request<T: Decodable>(url: String, completion: @escaping NetworkResult<T>)
}

class NetworkingManager: NetworkingManagerProtocol {
    
    static func request<T: Decodable>(url: String, completion: @escaping NetworkResult<T>) {
        let request = AF.request(url, method: .get, encoding: JSONEncoding.default)
        
        request.validate().responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let data = response.data ?? Data()
                    let result = try JSONDecoder().decode(T.self, from: data)

                    completion(.success(result))
                } catch {
                    completion(.failure(.decoding))
                }
            case .failure:
                completion(.failure(.networking))
            }
        }
    }
}
