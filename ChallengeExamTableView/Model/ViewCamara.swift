//
//  ViewCamara.swift
//  ChallengeExamTableView
//
//  Created by Moises Lugo on 16/06/20.
//  Copyright © 2020 challengeTableView. All rights reserved.
//

// MARK: El ejemplo no se presta mucho para una arquitectura, ni si quiera mvp que es la mas simple ya que el ejemplo
// todo es cuestion de vistas, realmente no vale la pena crear codigo extra cuando la aplicacion no lo requiere.
// hay que tener en cuenta siempre que entre menos codigo una aplicacion es mas optima. Practicamente la prueba fue un ejemplo de usos de TableViews.
// No se uso storyboards ni xib por lo mismo es una aplicacion simple que no requiere.


import Foundation
import UIKit
class ViewCamara: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    var imagePicker: UIImagePickerController!
    lazy var takedImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "iconProfilePdf")
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.layer.cornerRadius = 50
        img.clipsToBounds = true
        return img
    }()
    override func viewDidLoad() {
        self.title = Strings.titleCamera.rawValue
        self.view.backgroundColor = .white
        self.setUpView()
    }
    
    private func setUpView(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImage(tapGestureRecognizer:)))
        self.takedImage.isUserInteractionEnabled = true
        self.takedImage.addGestureRecognizer(tapGestureRecognizer)
        
        self.view.addSubview(self.takedImage)
        self.takedImage.translatesAutoresizingMaskIntoConstraints = false
        self.takedImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.takedImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.takedImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.takedImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    
    @objc func tapImage(tapGestureRecognizer : UITapGestureRecognizer) {
        self.callCamera()
    }
    
    func callCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Error \(info)")
        }
        self.takedImage.image = image
    }
}

