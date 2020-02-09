//
//  MainView.swift
//  Solar Warning
//
//  Created by FulltrackMobile on 09/02/20.
//  Copyright © 2020 rafaeldelegate. All rights reserved.
//

import UIKit

class MainView: UIViewController, MainViewViewProtocol {
    
    var presenter: MainViewPresenterProtocol?
    
    func render() {
        view.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
