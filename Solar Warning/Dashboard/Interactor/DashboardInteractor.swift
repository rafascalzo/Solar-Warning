//
//  DashboardInteractor.swift
//  Solar Warning
//
//  Created by Rafael Scalzo on 04/05/24.
//  Copyright © 2024 rafaeldelegate. All rights reserved.
//

import Foundation

protocol DashboardInteractorProtocol: AnyObject {
    func getUVIndex()
}

protocol DashboardInteractorOutputProtocol: AnyObject {
    func didReceivedUVIndex(data: RealTimeUVIndex?)
    func failureOnGetUVIndex(message: String)
}

class DashboardInteractor: DashboardInteractorProtocol {
    
    var output: DashboardInteractorOutputProtocol?
    
    func getUVIndex() {
        OpenUVAPI.UVIndex.requestAllData { (data, error) in
            if let error {
                self.output?.failureOnGetUVIndex(message: error)
            } else {
                self.output?.didReceivedUVIndex(data: data?.results)
            }
        }
    }
}
