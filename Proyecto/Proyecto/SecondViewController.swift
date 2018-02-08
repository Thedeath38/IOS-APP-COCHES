//
//  SecondViewController.swift
//  Proyecto
//
//  Created by Junts Pel Si on 25/1/18.
//  Copyright © 2018 Ultima Fila. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    
    var vmodelo:Modelo!
    var imodelo:Modelo!
    @IBOutlet weak var matricula:UITextField!
    @IBOutlet weak var aseguradoCoche: UISwitch!
    @IBOutlet weak var marcaCoche: UITextField!
    @IBOutlet weak var modeloCoche: UITextField!
    @IBOutlet weak var colorCoche: UITextField!
    @IBOutlet weak var insertar: UIButton!
    @IBOutlet weak var modificar: UIButton!
    @IBOutlet weak var itvCoche: UISwitch!
    @IBOutlet weak var borrar: UIButton!
    @IBOutlet weak var propietarioCoche: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        if(vmodelo == nil){
            matricula.text? = ""
            marcaCoche.text? = ""
            modeloCoche.text? = ""
            colorCoche.text? = ""
            propietarioCoche.text? = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hola")
        if(vmodelo != nil){
            imodelo=vmodelo
            print("adios \(vmodelo.matriculaCoche ?? "null")")
            matricula.text = vmodelo.matriculaCoche
            if(vmodelo.seguroCoche?.elementsEqual("SI"))!{
                aseguradoCoche.setOn(true, animated: true)
            }else{
                aseguradoCoche.setOn(false, animated: true)
            }
            marcaCoche.text = vmodelo.marcaCoche
            modeloCoche.text = vmodelo.modeloCoche
            colorCoche.text = vmodelo.colorCoche
            if(vmodelo.itvCoche?.elementsEqual("SI"))!{
                itvCoche.setOn(true, animated: true)
            }else{
                itvCoche.setOn(false, animated: true)
            }
            propietarioCoche.text = vmodelo.propietarioCoche
            modificar.isEnabled = true
            borrar.isEnabled = true
        }else{
            insertar.isEnabled = true
            matricula.isEnabled = true
            aseguradoCoche.isEnabled = true
            marcaCoche.isEnabled = true
            modeloCoche.isEnabled = true
            colorCoche.isEnabled = true
            itvCoche.isEnabled = true
            propietarioCoche.isEnabled = true
        }
    }
    
    
    @IBAction func insertarDatos(_ sender: Any) {
        if(matricula.text != ""){
            let seguro:String
            let itv:String
            if (aseguradoCoche.isOn) {
                seguro="SI"
            }else{
                seguro="NO"
            }
            
            if (itvCoche.isOn) {
                itv="SI"
            }else{
                itv="NO"
            }
            
            imodelo = Modelo(matriculaCoche: matricula.text!, seguroCoche: seguro, marcaCoche: marcaCoche.text!, modeloCoche: modeloCoche.text!, colorCoche: colorCoche.text!,itvCoche: itv, propietarioCoche: propietarioCoche.text!)
            
            let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.137.169/addCoches.php")! as URL)
            request.httpMethod = "POST"
            let postString = "matricula=\(imodelo.matriculaCoche ?? "")&seguro=\(imodelo.seguroCoche ?? "")&marca=\(imodelo.marcaCoche ?? "")&modelo=\(imodelo.modeloCoche ?? "")&color=\(imodelo.colorCoche ?? "")&propietario=\(imodelo.propietarioCoche ?? "")"
            
            
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            var message:String
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print("error=\(error)")
                    return
                }
                
                print("response = \(response)")
                
                
                // resultado (valor del echo de php)
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                if ((responseString?.isEqual(to: "1")))! {
                    print("Añadido")
                    
                }
                else {
                    print("Error al añadir")
                }
                
                print("responseString = \(responseString)")
            }
            task.resume()
        }
        }
        
        @IBAction func borrarDatos(_ sender: Any) {
            let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.137.169/delCoches.php")! as URL)
            request.httpMethod = "POST"
            let postString = "matricula=\(imodelo.matriculaCoche ?? "")"
            
            
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            var message:String
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print("error=\(error)")
                    return
                }
                
                print("response = \(response)")
                
                
                // resultado (valor del echo de php)
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                if ((responseString?.isEqual(to: "1")))! {
                    print("Añadido")
                    
                }
                else {
                    print("Error al añadir")
                }
                
                print("responseString = \(responseString)")
            }
            task.resume()
            _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func modificarDatos(_ sender: Any) {
        if(modificar.titleLabel?.text?.elementsEqual("Modificar"))!{
            modificar.setTitle("Aceptar", for: .normal)
            borrar.isEnabled = false
            aseguradoCoche.isEnabled = true
            marcaCoche.isEnabled = true
            modeloCoche.isEnabled = true
            colorCoche.isEnabled = true
            itvCoche.isEnabled = true
            propietarioCoche.isEnabled = true
        }else{
            modificar.setTitle("Modificar", for: .normal)
            insertar.isEnabled = false
            aseguradoCoche.isEnabled = false
            marcaCoche.isEnabled = false
            modeloCoche.isEnabled = false
            colorCoche.isEnabled = false
            itvCoche.isEnabled = false
            propietarioCoche.isEnabled = false
            borrar.isEnabled = true
            
            let seguro:String
            let itv:String
            if (aseguradoCoche.isOn) {
                seguro="SI"
            }else{
                seguro="NO"
            }
            
            if (itvCoche.isOn) {
                itv="SI"
            }else{
                itv="NO"
            }
            
            imodelo = Modelo(matriculaCoche: matricula.text!, seguroCoche: seguro, marcaCoche: marcaCoche.text!, modeloCoche: modeloCoche.text!, colorCoche: colorCoche.text!,itvCoche: itv, propietarioCoche: propietarioCoche.text!)
            
            let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.137.169/modCoches.php")! as URL)
            request.httpMethod = "POST"
            let postString = "matricula=\(imodelo.matriculaCoche ?? "")&seguro=\(imodelo.seguroCoche ?? "")&marca=\(imodelo.marcaCoche ?? "")&modelo=\(imodelo.modeloCoche ?? "")&color=\(imodelo.colorCoche ?? "")&propietario=\(imodelo.propietarioCoche ?? "")"
            
            
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            var message:String
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print("error=\(error)")
                    return
                }
                
                print("response = \(response)")
                
                
                // resultado (valor del echo de php)
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                if ((responseString?.isEqual(to: "1")))! {
                    print("Añadido")
                    
                }
                else {
                    print("Error al añadir")
                }
                
                print("responseString = \(responseString)")
            }
            task.resume()
        }
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

