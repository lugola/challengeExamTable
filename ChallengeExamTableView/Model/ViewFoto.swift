//
//  ViewFoto.swift
//  ChallengeExamTableView
//
//  Created by Moises Lugo on 16/06/20.
//  Copyright © 2020 challengeTableView. All rights reserved.
//

import Foundation
import UIKit
class ViewFoto: UIViewController  {
    private var url: String = Strings.url.rawValue
    lazy var downloadImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "iconProfilePdf")
        img.contentMode = .scaleAspectFill
        return img
    }()
    override func viewDidLoad() {
        self.title = Strings.titlePhoto.rawValue
        self.view.backgroundColor = .white
        self.setUpView()
        guard let url = URL(string:  self.url) else { return }
        
        _ =  UIImage().loadFrom(url: url) { image in
            if image == nil {
                self.callAlert(text: Strings.errorPhoto.rawValue)
                self.navigationController?.popViewController(animated: true)
            } else {
                self.downloadImage.image = image
            }
        }
    }
    
    private func setUpView(){
        self.view.addSubview(self.downloadImage)
        self.downloadImage.translatesAutoresizingMaskIntoConstraints = false
        self.downloadImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.downloadImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.downloadImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.downloadImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
}
