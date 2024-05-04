//
//  UserWireframe.swift
//  Solar Warning
//
//  Created by Rafael VSM on 10/02/20.
//  Copyright © 2020 Rafael VSM. All rights reserved.
//

import Foundation

protocol UserWireframeProtocol: AnyObject {
    var controller: UserView? { get set }
    
    static func createModule(viewRef: UserView)
}

class UserWireframe: UserWireframeProtocol {
    
    var controller: UserView?
    
    static func createModule(viewRef: UserView) {
        let presenter: UserPresenterProtocol & UserOutputInteractorProtocol = UserPresenter()
        
        viewRef.presenter = presenter
        viewRef.presenter?.view = viewRef
        viewRef.presenter?.interactor = UserInputInteractor()
        viewRef.presenter?.wireframe = UserWireframe()
        viewRef.presenter?.wireframe?.controller = viewRef
    }
}
