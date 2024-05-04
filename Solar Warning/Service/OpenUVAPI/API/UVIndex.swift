//
//  UVIndex.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/16/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import Foundation
import Alamofire


extension OpenUVAPI {
    
    struct UVIndex {
        
        typealias UVCompletion = (_ object:RealTimeUVIndexResponse?,_ error: String?) -> Void
        
        private init () {}
        
        static func requestAllData(completion: @escaping UVCompletion) {
            let uvIndexInput = UVIndexRequest(latitude: -23.15, longitude: 125.56)
            let date = Date.getStringDate(from: uvIndexInput.date)
            let url = URLComposer.buildURL(from: "?lat=\(uvIndexInput.latitude)&lng=\(uvIndexInput.longitude)&dt=\(date)")
            OpenUVAPI.requestObject(url, .get, parameters: nil, encoding: URLEncoding.default, withAuthentication: true, completion: completion)
        }
    }
}

struct UVIndexRequest {
    let latitude: Double
    let longitude: Double
    let date = Date()
}
