//
//  UserView.swift
//  Solar Warning
//
//  Created by FulltrackMobile on 10/02/20.
//  Copyright © 2020 rafaeldelegate. All rights reserved.
//

import UIKit

class UserView: UIViewController, UserViewProtocol {
    var presenter: UserPresenterProtocol?
    
    func render() {
        view.backgroundColor = .nightBackgroundColor
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UserWireframe.createModule(viewRef: self)
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
