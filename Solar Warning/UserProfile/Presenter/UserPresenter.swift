//
//  UserPresenter.swift
//  Solar Warning
//
//  Created by Rafael VSM on 10/02/20.
//  Copyright © 2020 Rafael VSM. All rights reserved.
//

import Foundation

protocol UserPresenterProtocol: AnyObject {
    var view: UserViewProtocol? { get set }
    var interactor: UserInputInteractorProtocol? { get set }
    var wireframe: UserWireframeProtocol? { get set }
    
    func viewDidLoad()
}

class UserPresenter: UserPresenterProtocol {
    
    var view: UserViewProtocol?
    var interactor: UserInputInteractorProtocol?
    var wireframe: UserWireframeProtocol?
    
    func viewDidLoad() {
        view?.render()
    }
}

protocol UserOutputInteractorProtocol: AnyObject {
    
}

extension UserPresenter: UserOutputInteractorProtocol {
    
}
