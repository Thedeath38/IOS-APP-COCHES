//
//  FirstViewController.swift
//  Proyecto
//
//  Created by Junts Pel Si on 25/1/18.
//  Copyright © 2018 Ultima Fila. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var feedItems: NSArray = NSArray()
    var selectedLocation : Modelo = Modelo()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "cell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: Modelo = feedItems[indexPath.row] as! Modelo
        // Get references to labels of cell
        myCell.textLabel!.text = item.matriculaCoche
        
        return myCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "identificador" {   // es el identifier del storyboar segue (la flecha que une  a los viewcontrolers
            
            if let viewDos = segue.destination as? SecondViewController {
                print("hola")
                viewDos.vmodelo=selectedLocation
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let item: Modelo = feedItems[indexPath.row] as! Modelo
        selectedLocation = item
        print(item.matriculaCoche ?? "none" )
    }
}
