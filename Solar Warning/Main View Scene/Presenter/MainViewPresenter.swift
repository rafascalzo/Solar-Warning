//
//  MainViewPresenter.swift
//  Solar Warning
//
//  Created by Rafael VSM on 09/02/20.
//  Copyright © 2020 Rafael VSM. All rights reserved.
//

import Foundation

class MainViewPresenter: MainViewPresenterProtocol {
    
    var view: MainViewViewProtocol?
    
    var interactor: MainViewInputInteractorProtocol?
    
    var wireframe: MainViewWireframeProtocol?
    
    func viewDidLoad() {
        view?.render()
    }
}

extension MainViewPresenter: MainViewOutputInteractorProtocol {
    
}
