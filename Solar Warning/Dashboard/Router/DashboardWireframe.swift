//
//  MainViewWireframe.swift
//  Solar Warning
//
//  Created by Rafael VSM on 09/02/20.
//  Copyright © 2020 Rafael VSM. All rights reserved.
//

import Foundation

protocol DashboardWireframeProtocol: AnyObject {
    
    var controller: DashboardView? { get set }
    
    static func createModule(viewRef: DashboardView)
}

class DashboardWireframe: DashboardWireframeProtocol {
    
    weak var controller: DashboardView?
    
    static func createModule(viewRef: DashboardView) {
        let presenter: DashboardPresenterProtocol & DashboardInteractorOutputProtocol = DashboardPresenter()
        let interactor = DashboardInteractor()
        interactor.output = presenter
        viewRef.presenter = presenter
        viewRef.presenter?.interactor = interactor
        viewRef.presenter?.view = viewRef
        viewRef.presenter?.wireframe = DashboardWireframe()
        viewRef.presenter?.wireframe?.controller = viewRef
        
        presenter.viewDidLoad()
    }
}
