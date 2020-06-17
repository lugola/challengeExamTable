//
//  ViewColores.swift
//  ChallengeExamTableView
//
//  Created by Moises Lugo on 16/06/20.
//  Copyright © 2020 challengeTableView. All rights reserved.
//

import Foundation
import UIKit
class ViewColores: UIViewController  {
    
    private var tableView: UITableView = UITableView()
    private var cellID = "cell"
    private let titlesTable = [Strings.blue, Strings.red, Strings.green, Strings.white, Strings.grey]
    private let colors = [UIColor.blue, UIColor.red, UIColor.green, UIColor.white, UIColor.gray]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Color Favorito"
        self.view.backgroundColor = .white
        self.initUI()
        
    }
    
    private func initUI() {
        self.tableView.register(CellViewTable.self, forCellReuseIdentifier: cellID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.setUpConstraints()
    }
    
    private func setUpConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        self.tableView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        self.tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
}


extension ViewColores:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CellViewTable
        cell.selectionStyle = .none
        cell.configure(titulo: self.titlesTable[indexPath.row].rawValue)
        cell.callBackSwitch = { [weak self] in
            self?.view.backgroundColor = self?.colors[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

