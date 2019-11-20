//
//  Constraints.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/19/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import Foundation
import UIKit

public enum Relation {
    case equalTo(view: UIView)
    case equalToSuperview
}

extension UIView {
    
    func addConstraints(top: Bool,_ topConstant: CGFloat?, bot: Bool,_ botConstant: CGFloat? ,leading: Bool ,_ leadingConstant: CGFloat?, trailing:Bool,_ trailingConstant: CGFloat?,relation: Relation) {
        translatesAutoresizingMaskIntoConstraints = false
        switch relation {
        case .equalTo(let view):
            if top { topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: topConstant != nil ? topConstant! : 0).isActive = true }
            if bot { bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: botConstant != nil ? -botConstant! : 0).isActive = true }
            if leading { leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstant != nil ? leadingConstant! : 0).isActive = true }
            if trailing { trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstant != nil ? -trailingConstant! : 0).isActive = true }
        case .equalToSuperview:
            if top { topAnchor.constraint(equalTo: superview!.layoutMarginsGuide.topAnchor, constant: topConstant != nil ? topConstant! : 0).isActive = true }
            if bot { topAnchor.constraint(equalTo: superview!.layoutMarginsGuide.bottomAnchor, constant: topConstant != nil ? topConstant! : 0).isActive = true }
            if leading { leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: leadingConstant != nil ? leadingConstant! : 0).isActive = true }
            if trailing { trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: trailingConstant != nil ? -trailingConstant! : 0).isActive = true }
        }
    }
}
