//
//  SettingsTableViewController.swift
//  LayoutTest
//
//  Created by CS User on 6/20/17.
//  Copyright © 2017 Princeton University. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var section = ["General", "Dietary Restrictions", "Allergies"]
    var items = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return self.section[section]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.section.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SettingsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SettingsTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of InventoryTableViewCell.")
        }
        
        // Configure the cell...
        let current = items[indexPath.section][indexPath.row]
        cell.setting.text = current
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Functions
    private func loadData()
    {
        items.append([String]())
        items.append([String]())
        items.append([String]())
        
        items[0].append("Notifications")
        items[1].append("Vegetarian")
        items[1].append("Vegan")
        items[1].append("Gluten Free")
        items[1].append("Dairy Free")
        items[1].append("Halal")
        items[1].append("Kosher")
        items[2].append("Milk")
        items[2].append("Eggs")
        items[2].append("Fish")
        items[2].append("Shellfish")
        items[2].append("Tree Nuts")
        items[2].append("Peanuts")
        items[2].append("Wheat")
        items[2].append("Soybeans")
    }
}
