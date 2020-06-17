//
//  ViewController.swift
//  ChallengeExamTableView
//
//  Created by Moises Lugo on 16/06/20.
//  Copyright © 2020 challengeTableView. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var tableView: UITableView = UITableView()
    private var optionSelected: String?
    private var isTapped: Bool = false
    private var cellID = "cell"
    private let titlesTable = [optionType.camera.rawValue, optionType.photo.rawValue, optionType.fullName.rawValue, optionType.mobileNumber.rawValue, optionType.dateBirth.rawValue,optionType.gender.rawValue, optionType.favoriteColor.rawValue]
    
    
    lazy var btnPickOption: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("Aceptar", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        
    }
    
    private func initUI() {
        self.tableView.register(CellViewTable.self, forCellReuseIdentifier: cellID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.btnPickOption)
        self.setUpConstraints()
    }
    
    private func setUpConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.btnPickOption.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        self.tableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        self.tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.btnPickOption.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.btnPickOption.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.btnPickOption.topAnchor.constraint(equalTo: self.tableView.bottomAnchor).isActive = true
        self.btnPickOption.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    
    @objc func tapBtn() {
        if self.isTapped {
            switch optionSelected! {
            case optionType.camera.rawValue:
                let vc = ViewCamara()
                self.navigationController?.pushViewController(vc, animated: true)
                break;
                
            case optionType.fullName.rawValue:
                let vc = ViewNombre()
                self.navigationController?.pushViewController(vc, animated: true)
                break;
                
            case optionType.favoriteColor.rawValue:
                let vc = ViewColores()
                self.navigationController?.pushViewController(vc, animated: true)
                break;
                
            case optionType.gender.rawValue:
                let vc = ViewSexo()
                self.navigationController?.pushViewController(vc, animated: true)
                break;
                
            case optionType.dateBirth.rawValue:
                let vc = ViewFecha()
                self.navigationController?.pushViewController(vc, animated: true)
                break;
                
            case optionType.mobileNumber.rawValue:
                let vc = ViewTelefono()
                self.navigationController?.pushViewController(vc, animated: true)
                break;
                
            case optionType.photo.rawValue:
                let vc = ViewFoto()
                self.navigationController?.pushViewController(vc, animated: true)
                break;
            default:
                self.callAlert(text: Strings.notOption.rawValue)
                break
            }
        }else {
            self.callAlert(text: Strings.selectedEmpty.rawValue)
        }
    }
    
}


extension ViewController:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CellViewTable
        cell.selectionStyle = .none
        cell.configure(titulo: self.titlesTable[indexPath.row])
        
        cell.callBackSwitch = { [weak self] in
            self?.isTapped = true
            self?.optionSelected = self?.titlesTable[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

