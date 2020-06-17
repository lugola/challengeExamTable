//
//  ViewNombre.swift
//  ChallengeExamTableView
//
//  Created by Moises Lugo on 16/06/20.
//  Copyright © 2020 challengeTableView. All rights reserved.
//

import Foundation
import UIKit
class ViewNombre: UIViewController, UITextFieldDelegate  {
    let maxLength = 35
    
    lazy var txtNombre: UITextField = {
        let text = UITextField()
        text.roundedTextField(placeholder: Strings.placeHolderName.rawValue)
        text.delegate = self
        text.tag = 1
        return text
        
    }()
    override func viewDidLoad() {
        self.title = Strings.titleName.rawValue
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.txtNombre)
        self.txtNombre.translatesAutoresizingMaskIntoConstraints = false
        self.txtNombre.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.txtNombre.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.txtNombre.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.txtNombre.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
