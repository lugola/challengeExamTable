//
//  AllClasesStr.swift
//  ChallengeExamTableView
//
//  Created by Moises Lugo on 16/06/20.
//  Copyright © 2020 challengeTableView. All rights reserved.
//

import Foundation


enum Strings: String{
    
    
    //MARK: Alerts
    case errorPhoto = "No se pudo cargar la imagen"
    case errorTitle = "Error"
    case acepted = "Aceptar"
    case notOption = "Esta opcion no existe"
    case selectedEmpty = "Debe seleccionar una opcion"
    
    //MARK: Views
    
    //ViewSexo
    case gender = "Sexo"
    case male = "Hombre"
    case female =  "Mujer"
    
    //ViewTelefono
    case placeHolderNumero = "Escribe un numero"
    case titleNumero = "Numero de Telefono"
    
    //ViewColores
    case blue = "Azul"
    case green = "Verde"
    case red = "Rojo"
    case white = "Blanco"
    case grey = "Gris"
    
    
    //ViewCamera
    case titleCamera = "Camara"
    
    
    //ViewFoto
    case url = "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg"
    case titlePhoto = "Foto"
    
    
    //ViewNombre
    case placeHolderName = "Escribe un nombre"
    case titleName = "Nombre Completo"
    
    //ViewFecha
    
    case placeHolderDate = "Tu fecha:"
    case titleDateBirth = "Fecha de Nacimiento"
    
    
    
    
}

enum optionType: String {
    case camera = "Camara"
    case photo = "Foto"
    case fullName = "Nombre Completo"
    case mobileNumber = "Numero Telefonico"
    case dateBirth = "Fecha de Nacimiento"
    case gender = "Sexo"
    case favoriteColor = "Color Favorito"
}

        
