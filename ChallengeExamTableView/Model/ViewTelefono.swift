//
//  ViewTelefono.swift
//  ChallengeExamTableView
//
//  Created by Moises Lugo on 16/06/20.
//  Copyright © 2020 challengeTableView. All rights reserved.
//

import Foundation
import UIKit
class ViewTelefono: UIViewController, UITextFieldDelegate  {
    let maxLength = 10
    lazy var txtNumero: UITextField = {
        let text = UITextField()
        text.roundedTextField(placeholder: Strings.placeHolderNumero.rawValue)
        text.delegate = self
        text.tag = 1
        return text
        
    }()
    override func viewDidLoad() {
        self.title = Strings.titleNumero.rawValue
        self.view.backgroundColor = .white
        self.view.addSubview(self.txtNumero)
        self.txtNumero.translatesAutoresizingMaskIntoConstraints = false
        self.txtNumero.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.txtNumero.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.txtNumero.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.txtNumero.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
