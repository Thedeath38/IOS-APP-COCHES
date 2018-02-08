//
//  HomeModel.swift
//  Proyecto
//
//  Created by Junts Pel Si on 25/1/18.
//  Copyright © 2018 Ultima Fila. All rights reserved.
//

import Foundation


protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    let urlPath = "http://192.168.137.169/selectCoches.php"
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let modelos = NSMutableArray()
        print("sssssss")
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            let modelo = Modelo()
            
            
            //the following insures none of the JsonElement values are nil through optional binding
            if  let matriculaCoche = jsonElement["matricula"] as? String,
                let seguroCoche = jsonElement["seguro"] as? String,
                let marcaCoche = jsonElement["marca"] as? String,
                let modeloCoche = jsonElement["modelo"] as? String,
                let colorCoche = jsonElement["color"] as? String,
                let itvCoche = jsonElement["itv"] as? String,
                let propietarioCoche = jsonElement["propietario"] as? String
            {
                modelo.matriculaCoche = matriculaCoche
                modelo.seguroCoche = seguroCoche
                modelo.marcaCoche = marcaCoche
                modelo.modeloCoche = modeloCoche
                modelo.colorCoche = colorCoche
                modelo.itvCoche = itvCoche
                modelo.propietarioCoche = propietarioCoche
            }
            print("hhhhhh")
            
            modelos.add(modelo)
        }
        print("rrrrrrr")
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: modelos)
            
        })
    }
}
