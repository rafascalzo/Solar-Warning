//
//  OpenUVAPI.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/16/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import Foundation
import Alamofire

class OpenUVAPI: Session {
    
    static var baseURL: String {
        return Bundle.main.infoDictionary?["BASE_URL"] as! String
    }
    static var apiKey: String {
        return Bundle.main.infoDictionary?["API_KEY"] as! String
    }
    
    static var authenticationHeader: [String:String] {
        return [
          "x-access-token": "\(apiKey)"
        ]
    }
    
    private convenience init() {
        let configuration = URLSessionConfiguration.default
                configuration.timeoutIntervalForRequest = 10
                configuration.timeoutIntervalForResource = 10
        self.init(configuration: configuration)
    }
    
    static func request(_ url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> DataRequest {
        let dataRequest = AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        return dataRequest
    }
    
    static func requestObject<T: Decodable>(_ url: URLConvertible,_ method: HTTPMethod,parameters: EncodableObject? = nil, encoding: ParameterEncoding = JSONEncoding.default, withAuthentication: Bool, completion: @escaping (T?,String?) -> Void) {
        
        guard Network.isConnectedToNetwork() else {
            completion(nil, "no_connection")
            return
        }
        
        var parametersDictionary: [String:Any]?
        
        if let parameters = parameters {
            do {
                let data = try JSONEncoder().encode(parameters)
                parametersDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch let error {
                completion(nil,error.localizedDescription)
            }
        }
        
        var headers: HTTPHeaders?
        if withAuthentication {
            headers = HTTPHeaders(authenticationHeader)
        }
        
        request(url, method: method, parameters: parametersDictionary, encoding: encoding, headers: headers).validate().responseJSON { (response) in
            
            if response.response?.statusCode == HTTPStatus.unauthorized.rawValue {
                completion(nil, "unnauthorized")
            }
            guard let data = response.data else {
                completion(nil,"missing data")
                return
            }
            switch response.result {
            case .success:
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedObject, nil)
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
            
        }
    }
}

struct URLComposer {
    
    static func buildURL(from path: String) -> URLConvertible {
        return OpenUVAPI.baseURL + path
    }
}
