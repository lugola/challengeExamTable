//
//  Extensiones.swift
//  ChallengeExamTableView
//
//  Created by Moises Lugo on 16/06/20.
//  Copyright © 2020 challengeTableView. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func callAlert(text: String) {
        
        let alert = UIAlertController(title: Strings.errorTitle.rawValue, message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Strings.acepted.rawValue, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}

extension UITextField {
    func roundedTextField( placeholder:String) {
        let placeHolder1 = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.5)])
        self.attributedPlaceholder = placeHolder1
        self.backgroundColor = .white
        self.layer.borderColor = backgroundColor?.cgColor
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
    }
}

extension UIImage {
    func  loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
