//
//  UserViewProtocols.swift
//  Solar Warning
//
//  Created by Rafael VSM on 10/02/20.
//  Copyright © 2020 rafaeldelegate. All rights reserved.
//

import Foundation

protocol UserViewProtocol: class {
    var presenter : UserPresenterProtocol? { get set }
    
    func render()
}

protocol UserInputInteractorProtocol: class {
    
}

protocol UserPresenterProtocol: class {
    var view: UserViewProtocol? { get set }
    var interactor: UserInputInteractorProtocol? { get set }
    var wireframe: UserWireframeProtocol? { get set }
    
    func viewDidLoad()
}

protocol UserOutputInteractorProtocol: class {
    
}

protocol UserWireframeProtocol: class {
    
    var controller: UserView? { get set }
    
    static func createModule(viewRef: UserView)
}
