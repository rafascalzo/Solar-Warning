//
//  UserPresenter.swift
//  Solar Warning
//
//  Created by Rafael VSM on 10/02/20.
//  Copyright © 2020 Rafael VSM. All rights reserved.
//

import Foundation

class UserPresenter: UserPresenterProtocol {
    var view: UserViewProtocol?
    
    var interactor: UserInputInteractorProtocol?
    
    var wireframe: UserWireframeProtocol?
    
    func viewDidLoad() {
        view?.render()
    }
    
    
}

extension UserPresenter: UserOutputInteractorProtocol {
    
}
