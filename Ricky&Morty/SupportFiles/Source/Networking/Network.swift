//
//  Network.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 26/01/21.
//

import Foundation
import Alamofire

typealias RequestSuccess<T: Decodable> = (_ result: T?) -> Void
typealias RequestFailure = (_ error: AFError?) -> Void

protocol Networking {
    
    static func request<T: Decodable>(data: RequestData,
                                      decoder: DefaultDecoder<T>,
                                      success: @escaping RequestSuccess<T>,
                                      failure: @escaping RequestFailure)
}
class Network: Networking {
    
    static func request<T>(data: RequestData,
                           decoder: DefaultDecoder<T>,
                           success: @escaping RequestSuccess<T>,
                           failure: @escaping RequestFailure) {
        
        let request = AF.request(
            data.url,method: data.method,
            parameters: data.parameters,
            encoding: data.encoding)
        
        request.validate().responseJSON { response in
            switch response.result {
            case.success:
                let data = response.data ?? Data()
                success(decoder.decode(from: data))
            case.failure:
                failure(response.error)
            }
        }
    }
    
}
