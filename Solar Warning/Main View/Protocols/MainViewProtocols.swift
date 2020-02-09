//
//  MainViewProtocols.swift
//  Solar Warning
//
//  Created by Rafael VSM on 09/02/20.
//  Copyright © 2020 rafaeldelegate. All rights reserved.
//

import Foundation

protocol MainViewViewProtocol: class {
    
    var presenter: MainViewPresenterProtocol? { get set }
    
    func render()
}

protocol MainViewPresenterProtocol: class {
    
    var view: MainViewViewProtocol? { get set }
    var interactor: MainViewInputInteractorProtocol? { get set }
    var wireframe: MainViewWireframeProtocol? { get set }
    
    func viewDidLoad()
}

protocol MainViewInputInteractorProtocol: class {
    
}

protocol MainViewOutputInteractorProtocol: class {
    
}

protocol MainViewWireframeProtocol: class {
    
    var controller: MainView? { get set }
    
    static func createModule(viewRef: MainView)
}

