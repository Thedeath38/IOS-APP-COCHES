//
//  Modelo.swift
//  Proyecto
//
//  Created by Junts Pel Si on 25/1/18.
//  Copyright © 2018 Ultima Fila. All rights reserved.
//

import Foundation


class Modelo: NSObject {
    
    //properties
    
    var matriculaCoche: String?
    var seguroCoche: String?
    var marcaCoche: String?
    var modeloCoche: String?
    var colorCoche: String?
    var itvCoche: String?
    var propietarioCoche: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(matriculaCoche: String, seguroCoche: String, marcaCoche: String, modeloCoche: String, colorCoche: String, itvCoche:String, propietarioCoche: String) {
        
        self.matriculaCoche = matriculaCoche
        self.seguroCoche = seguroCoche
        self.marcaCoche = marcaCoche
        self.modeloCoche = modeloCoche
        self.colorCoche = colorCoche
        self.itvCoche = itvCoche
        self.propietarioCoche = propietarioCoche
        
    }
    
    
    /*//prints object's current state
    
    override var description: String {
        return "cod: \(cod), cosa: \(cosa)"
        
    }*/
    
    
}
