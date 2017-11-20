//
//  ItemTableViewController.swift
//  Collector
//
//  Created by Kevin Mudiandambo on 11/17/17.
//  Copyright © 2017 Kevin Mudiandambo. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    var collectorItems : [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectorItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let item = collectorItems[indexPath.row]
        
        cell.textLabel?.text = item.title

        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getItemsFromCoreData()
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    //MARK: functions
    
    /*
     Retrieves the items saved to core data to load into the table view
     cells
     */
    func getItemsFromCoreData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreData = try? context.fetch(Item.fetchRequest()) as? [Item] {
                if let coreDataItems = coreData {
                    collectorItems = coreDataItems
                    tableView.reloadData()
                }
            }
        }
    }

}
