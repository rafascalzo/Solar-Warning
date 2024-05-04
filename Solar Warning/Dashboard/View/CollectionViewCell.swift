//
//  CollectionViewCell.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/17/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import UIKit

class SunCollectionViewCell: UICollectionViewCell {
    
    var label: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 10)
        lb.textColor = .white
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    var view: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var viewHeightAnchor: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addSubview(view)
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        viewHeightAnchor = view.heightAnchor.constraint(equalToConstant: 200)
        viewHeightAnchor.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
