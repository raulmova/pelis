//
//  Pelicula.swift
//  PeliculasApp
//
//  Created by Alumno ITESM Toluca on 01/11/17.
//  Copyright © 2017 Alumno ITESM Toluca. All rights reserved.
//

import Foundation
import UIKit

class Pelicula {
    var nombre : String
    var compania : String
    var foto : UIImage?
    var rating : Int
    
    init?(nombre:String, compania:String, foto:UIImage?, rating:Int){
        guard !nombre.isEmpty && !compania.isEmpty && foto != nil else {
            return nil
        }
        
        guard rating >= 0 && rating <= 5 else {
            return nil
        }
        
        self.nombre = nombre
        self.compania = compania
        self.foto = foto
        self.rating = rating
    }
}
