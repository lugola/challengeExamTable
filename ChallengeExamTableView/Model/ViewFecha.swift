//
//  ViewFecha.swift
//  ChallengeExamTableView
//
//  Created by Moises Lugo on 16/06/20.
//  Copyright © 2020 challengeTableView. All rights reserved.
//

import Foundation
import UIKit

class ViewFecha: UIViewController {
    
    
    lazy var txtDatePicker: UITextField = {
        let text = UITextField()
        text.roundedTextField(placeholder: Strings.placeHolderDate.rawValue)
        return text
        
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(self.dateSelected), for: .valueChanged)
        return datePicker
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Strings.titleDateBirth.rawValue
        self.view.backgroundColor = .white
        self.setUp()
        
    }
    
    private func setUp(){
        self.view.addSubview(self.txtDatePicker)
        self.view.addSubview(self.datePicker)
        self.setConstraints()
        self.showDatePicker()
    }
    private func setConstraints(){
        self.txtDatePicker.translatesAutoresizingMaskIntoConstraints = false
        self.datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        self.txtDatePicker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.txtDatePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.txtDatePicker.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.txtDatePicker.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.datePicker.topAnchor.constraint(equalTo: self.txtDatePicker.bottomAnchor).isActive = true
        self.datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.datePicker.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.datePicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func showDatePicker(){
        datePicker.datePickerMode = .date
        txtDatePicker.inputView = datePicker
        
    }
    
    @objc func dateSelected(sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtDatePicker.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
}

