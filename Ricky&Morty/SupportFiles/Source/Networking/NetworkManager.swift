//
//  NetworkManager.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 02/02/21.
//

import Foundation
import Alamofire

typealias RequestError = (_ error: AFError?) -> Void
typealias RequestSuccess<T: Decodable> = (_ result: T?) -> Void

protocol Networking {
    
    static func request<T: Decodable>(data:RequestData,
                                      decoder: DefaultDecoder<T>,
                                      success: @escaping RequestSuccess<T>,
                                      failure: @escaping RequestError)
}

class NetworkManager: Networking {
    
    static func request<T: Decodable>(data: RequestData,
                                      decoder: DefaultDecoder<T>,
                                      success: @escaping RequestSuccess<T>,
                                      failure: @escaping RequestError) {
        
        let request =  AF.request(data.url, method: data.method)
        
        
        request.validate().responseJSON { response in
            switch response.result {
            case .success(_):
                let data = response.data ?? Data()
                success(decoder.decode(from: data))
            case .failure:
                failure(response.error)
            }
        }
    }
}












