//
//  InventoryTableViewController.swift
//  LayoutTest
//
//  Created by Abby Breitfeld on 6/19/17.
//  Copyright © 2017 Princeton University. All rights reserved.
//

import UIKit

class InventoryTableViewController: UITableViewController {
    
    //MARK: Properties
    var categories = [Category]()
    
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "InventoryTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? InventoryTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of InventoryTableViewCell.")
        }
        
        // Configure the cell
        let current = categories[indexPath.row]
        cell.categoryName.text = current.name
        cell.icon.image = current.icon
        
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Get the new view controller using segue.destinationViewController.
        guard let categoryDetailViewController = segue.destination as? IngredientTableViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        // Pass the selected object to the new view controller.
        guard let cell = sender as? InventoryTableViewCell else {
                fatalError("The dequeued cell is not an instance of IngredientTableViewCell.")
        }
        categoryDetailViewController.ingredientCategory = cell.categoryName.text
    }
    
    
    //MARK: Private Methods
    
    private func loadData() {
        // Load all images
        let icon1 = UIImage(named: "dairy")
        let icon2 = UIImage(named: "meat")
        let icon3 = UIImage(named: "vegetables")
        let icon4 = UIImage(named: "fruits")
        let icon5 = UIImage(named: "fish")
        let icon6 = UIImage(named: "grains")
        let icon7 = UIImage(named: "spices")
        let icon8 = UIImage(named: "nut")
        let icon9 = UIImage(named: "legumes")
        let icon10 = UIImage(named: "condiments")
        let icon11 = UIImage(named: "dessert")
        let icon12 = UIImage(named: "soup")
        let icon13 = UIImage(named: "beverage")
        
        // Initialize category names
        guard let category1 = Category(name: "Dairy", icon: icon1!) else {
            fatalError("Unable to instantiate category1")
        }
        
        guard let category2 = Category(name: "Meat", icon: icon2!) else {
            fatalError("Unable to instantiate category2")
        }
        
        guard let category3 = Category(name: "Vegetables", icon: icon3!) else {
            fatalError("Unable to instantiate category3")
        }
        
        guard let category4 = Category(name: "Fruits", icon: icon4!) else {
            fatalError("Unable to instantiate category4")
        }
        
        guard let category5 = Category(name: "Fish and Seafood", icon: icon5!) else {
            fatalError("Unable to instantiate category5")
        }
        
        guard let category6 = Category(name: "Baking and Grains", icon: icon6!) else {
            fatalError("Unable to instantiate category6")
        }
        
        guard let category7 = Category(name: "Spices and Seasonings", icon: icon7!) else {
            fatalError("Unable to instantiate category7")
        }
        
        guard let category8 = Category(name: "Nuts and Seeds", icon: icon8!) else {
            fatalError("Unable to instantiate category8")
        }
        
        guard let category9 = Category(name: "Legumes", icon: icon9!) else {
            fatalError("Unable to instantiate category9")
        }
        
        guard let category10 = Category(name: "Condiments and Sauces", icon: icon10!) else {
            fatalError("Unable to instantiate category10")
        }
        
        guard let category11 = Category(name: "Desserts and Snacks", icon: icon11!) else {
            fatalError("Unable to instantiate category11")
        }
        
        guard let category12 = Category(name: "Soup", icon: icon12!) else {
            fatalError("Unable to instantiate category12")
        }
        
        guard let category13 = Category(name: "Beverages and Alcohol", icon: icon13!) else {
            fatalError("Unable to instantiate category13")
        }
        
        categories += [category1, category2, category3, category4, category5, category6, category7, category8, category9, category10, category11, category12, category13]
    }

}
