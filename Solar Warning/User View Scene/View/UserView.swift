//
//  UserView.swift
//  Solar Warning
//
//  Created by Rafael VSM on 10/02/20.
//  Copyright © 2020 rafaeldelegate. All rights reserved.
//

import UIKit
private let userImageViewSize:CGSize = CGSize(width: 150, height: 150)
private let userProfileReuseIdentifier = "OptionsUserProfile"
class UserView: UIViewController, UserViewProtocol {
    
    var presenter: UserPresenterProtocol?
    var backGroundImageView: UIImageView!
    var userImageView: UIImageView!
    var userOptionsContainerView: UIView!
    var userName: UILabel!
    var userEmail: UILabel!
    var lineSeparatorView: UIView!
    var optionsTableView: UITableView!
    var saveButton: UIButton!
    var backButton: UIButton!
    
    func render() {
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        configureView()
        navigationController?.navigationBar.isHidden = true
    }
    
    fileprivate func configureView() {
        backGroundImageView = UIImageView()
        backGroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backGroundImageView.contentMode = .scaleAspectFill
        
        view.addSubview(backGroundImageView)
        NSLayoutConstraint.activate([
            backGroundImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGroundImageView.heightAnchor.constraint(equalToConstant: view.frame.width * 0.7)
        ])
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: view.frame.width, height: view.frame.width))
        
        let image = renderer.image { ctx in
            let context = ctx.cgContext
            
            UIColor.moonColor.setFill()
            context.fillEllipse(in: CGRect(origin: CGPoint(x: view.frame.width / 4, y: -view.frame.width / 4), size: CGSize(width: view.frame.width, height: view.frame.width)))
            
            UIColor.moonTrackStrokeColor.setFill()
            context.fillEllipse(in: CGRect(origin: CGPoint(x: view.frame.width / 4, y: -view.frame.width / 4), size: CGSize(width: view.frame.width * (1/3), height: view.frame.width * (1/3))))
            
            UIColor.black.setFill()
            context.fillEllipse(in: CGRect(origin: CGPoint(x: -view.frame.width / 2, y: -view.frame.width / 4), size: CGSize(width: view.frame.width, height: view.frame.width)))
            
            
            context.drawPath(using: .fill)
        }
        backGroundImageView.image = image
        
        userOptionsContainerView = UIView()
        userOptionsContainerView.translatesAutoresizingMaskIntoConstraints = false
        userOptionsContainerView.backgroundColor = .white
        userOptionsContainerView.layer.cornerRadius = 8
        
        userImageView = UIImageView()
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.cornerRadius = userImageViewSize.height / 2
        userImageView.backgroundColor = .yellow
        userImageView.layer.borderColor = UIColor.lightGray.cgColor
        userImageView.layer.borderWidth = 0.5
        userImageView.layer.masksToBounds = true
        
        userName = UILabel()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.font = UIFont.boldSystemFont(ofSize: 26)
        userName.textColor = .lightGray
        userName.text = "Rafael V S M"

        userEmail = UILabel()
        userEmail.translatesAutoresizingMaskIntoConstraints = false
        userEmail.font = UIFont.systemFont(ofSize: 12)
        userEmail.textColor = .lightGray
        userEmail.text = "Rafael_V_S_M@email.com"

        lineSeparatorView = UIView()
        lineSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        lineSeparatorView.backgroundColor = .lightGray

        optionsTableView = UITableView(frame: .zero, style: .plain)
        optionsTableView.translatesAutoresizingMaskIntoConstraints = false
        optionsTableView.register(UITableViewCell.self, forCellReuseIdentifier: userProfileReuseIdentifier)
        optionsTableView.delegate = self
        optionsTableView.dataSource = self
        optionsTableView.layer.cornerRadius = 8
        optionsTableView.isScrollEnabled = false
        
        backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
        backButton.layer.cornerRadius = 8
        backButton.layer.borderColor = UIColor.lightGray.cgColor
        backButton.backgroundColor = .white
        backButton.layer.borderWidth = 0.5
        backButton.layer.masksToBounds = true
        backButton.addTarget(self, action: #selector(handleBackArrowTapped), for: .touchUpInside)
        
        saveButton = UIButton()
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.layer.cornerRadius = 8
        saveButton.layer.borderColor = UIColor.lightGray.cgColor
        saveButton.layer.borderWidth = 0.5
        saveButton.layer.masksToBounds = true
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .systemBlue
        
        view.addSubview(userOptionsContainerView)
        userOptionsContainerView.addSubview(userImageView)
        userOptionsContainerView.addSubview(userName)
        userOptionsContainerView.addSubview(userEmail)
        userOptionsContainerView.addSubview(lineSeparatorView)
        userOptionsContainerView.addSubview(optionsTableView)
        view.addSubview(backButton)
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            userOptionsContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            userOptionsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            userOptionsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userOptionsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            userImageView.topAnchor.constraint(equalTo: userOptionsContainerView.topAnchor, constant: -userImageViewSize.height / 2),
            userImageView.heightAnchor.constraint(equalToConstant: userImageViewSize.height),
            userImageView.widthAnchor.constraint(equalToConstant: userImageViewSize.width),
            userImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userName.centerXAnchor.constraint(equalTo: userOptionsContainerView.centerXAnchor),
            userName.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 7),

            userEmail.centerXAnchor.constraint(equalTo: userOptionsContainerView.centerXAnchor),
            userEmail.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 7),

            lineSeparatorView.topAnchor.constraint(equalTo: userEmail.bottomAnchor, constant: 7),
            lineSeparatorView.centerXAnchor.constraint(equalTo: userOptionsContainerView.centerXAnchor),
            lineSeparatorView.widthAnchor.constraint(equalTo: userOptionsContainerView.widthAnchor),
            lineSeparatorView.heightAnchor.constraint(equalToConstant: 0.5),

            optionsTableView.topAnchor.constraint(equalTo: lineSeparatorView.bottomAnchor, constant: 5),
            optionsTableView.widthAnchor.constraint(equalTo: userOptionsContainerView.widthAnchor),
            optionsTableView.centerXAnchor.constraint(equalTo: userOptionsContainerView.centerXAnchor),
            optionsTableView.bottomAnchor.constraint(equalTo: userOptionsContainerView.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: userOptionsContainerView.bottomAnchor, constant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 80),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.leadingAnchor.constraint(equalTo: userOptionsContainerView.leadingAnchor),
            
            saveButton.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 30),
            saveButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.trailingAnchor.constraint(equalTo: userOptionsContainerView.trailingAnchor)
        ])
    }
    
    @objc func handleBackArrowTapped(_ sender: Any) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserWireframe.createModule(viewRef: self)
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = true
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

extension UserView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userProfileReuseIdentifier, for: indexPath)
        cell.textLabel?.text = "test"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (((view.frame.height * 0.5) - (userImageViewSize.height))) / 5
    }
    
}
