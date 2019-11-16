//
//  ViewController.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/15/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    lazy var tableView: UITableView  = {
        let tv = UITableView(frame: .zero, style: .plain)
        
        return tv
    }()
    
    var dataModel = [[UIColor]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "fada")
        tableView.delegate = self
        tableView.dataSource = self
        for _ in 0..<4 {
            var colors = [UIColor]()
            for _ in 0..<Int.random(in: 0...35) {
                colors.append(UIColor.randomColor())
            }
            dataModel.append(colors)
        }
        render()
        tableView.reloadData()
        
        OpenUVAPI.UVIndex.requestAllData { (data, error) in
            if error != nil {
                print(error!)
            } else {
                print(data!)
            }
            
        }
        
    }
    
    func render() {
        title = "Bruna Fujikawa"
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.frame = self.view.frame
    }
    
    let fadaQualities = ["é linda","tem um sorriso agradável","tem um olhar bonito","é gostosa","é muito gata","é inteligente","é hilária","é maravilhosa","é um doce","é uma delícia","é da paz","tem o melhor beijo","é puro amor"]
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fada", for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        cell.textLabel?.text = "A fada \(fadaQualities.randomElement()!)"
        
        return cell
    }
}
