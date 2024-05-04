//
//  DashboardPresenter.swift
//  Solar Warning
//
//  Created by Rafael VSM on 09/02/20.
//  Copyright © 2020 Rafael VSM. All rights reserved.
//

import Foundation

protocol DashboardPresenterProtocol: AnyObject {
    var view: DashboardViewProtocol? { get set }
    var interactor: DashboardInteractorProtocol? { get set }
    var wireframe: DashboardWireframeProtocol? { get set }
    
    func viewDidLoad()
}

class DashboardPresenter: DashboardPresenterProtocol {
    
    var view: DashboardViewProtocol?
    var interactor: DashboardInteractorProtocol?
    var wireframe: DashboardWireframeProtocol?
    
    func viewDidLoad() {
        view?.render()
        interactor?.getUVIndex()
    }
}

extension DashboardPresenter: DashboardInteractorOutputProtocol {
    func didReceivedUVIndex(data: RealTimeUVIndex?) {
        self.view?.updateContent(data?.sunInfo, data?.safeExposureTime)
    }
    
    func failureOnGetUVIndex(message: String) {
        print("Error \(message)", #file)
    }
}
