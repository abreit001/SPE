//
//  IngredientTableViewController.swift
//  LayoutTest
//
//  Created by Abby Breitfeld on 6/19/17.
//  Copyright © 2017 Princeton University. All rights reserved.
//

import UIKit
import os.log

class IngredientTableViewController: UITableViewController {

    //MARK: Properties
    var ingredientCategory: String?
    var ingredients = [Ingredient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load any saved items, otherwise load sample data.
        if let savedPantry = loadPantry() {
            ingredients += savedPantry
        }
        else {
            // Load the sample data.
            loadExampleData()
        }
        
        // Use the edit button item provided by the table view controller.
        navigationItem.rightBarButtonItem = editButtonItem
        
        // Change the title of the scene
        navigationItem.title = ingredientCategory
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
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
        return ingredients.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "IngredientTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? IngredientTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of IngredientTableViewCell.")
        }
        
        // Configure the cell
        let current = ingredients[indexPath.row]
        
        cell.name.text = current.name
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        cell.exp.text = formatter.string(from: current.exp)
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool){
        
        // overriding this method means we can attach custom functions to the button
        super.setEditing(editing, animated:animated);
        
        // attaching custom actions here
        if editing {
            print("Editing")
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
            for index in 0..<ingredients.count {
                if ingredients[index].selected {
                    let indexPath = IndexPath(row: index, section: 0)
                    tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
                }
            }
        }
        else {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
            savePantry()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.isEditing {
            return UITableViewAutomaticDimension
        }
        else if ingredients[indexPath.row].selected == false {
            return 0
        }
        else {
            return UITableViewAutomaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Unselected")
        ingredients[indexPath.row].selected = false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
        ingredients[indexPath.row].selected = true
    }

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
    }*/
    
    //MARK: Private Methods
    
    private func loadExampleData() {
        
        let fileName = ingredientCategory
        let fileUrl = Bundle.main.url(forResource: fileName, withExtension: ".txt")
        let foodList = try! String (contentsOf: fileUrl!, encoding: String.Encoding.utf8)
        let foods = foodList.components(separatedBy:.newlines)
        for food in foods {
            if (food != "") {
                guard let item = Ingredient(name: food, exp: Date.init()) else {
                    fatalError("Unable to instantiate item")
                }
                ingredients.append(item)
            }
        }
    }
    
    private func savePantry() {
        let ArchiveURL = Ingredient.DocumentsDirectory.appendingPathComponent(ingredientCategory!)
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(ingredients, toFile: ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Pantry successfully saved.", log: OSLog.default, type: .debug)
        }
        else {
            os_log("Failed to save pantry items...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadPantry() -> [Ingredient]? {
        let ArchiveURL = Ingredient.DocumentsDirectory.appendingPathComponent(ingredientCategory!)
        return NSKeyedUnarchiver.unarchiveObject(withFile: ArchiveURL.path) as? [Ingredient]
    }


}
