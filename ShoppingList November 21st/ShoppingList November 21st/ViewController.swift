//
//  ViewController.swift
//  ShoppingList November 21st
//
//  Created by Margiett Gil on 11/21/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var shoppingList = ShoppingItem.groceries
    
    var isEditingTableView = false {
        didSet { // property observer
            //toggle editing mode of table view
            tableView.isEditing = isEditingTableView
            //toggle bar button item's title between edit and done
            navigationItem.leftBarButtonItem?.title = isEditingTableView ? "Done" : "Edit"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        shoppingList = ShoppingItem.groceries
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           guard let addingItemVC = segue.destination as? AddingItemsViewController else {
               fatalError("Issues with segue")
           }
           addingItemVC.title = "Add items"
       }
    //MARK: Segue
    @IBAction func addingItem(segue: UIStoryboardSegue) {
        
        print("confirming item")
        
        guard let addingItemsVC = segue.source as? AddingItemsViewController, let confirmingItem = addingItemsVC.newItem else {
            fatalError("failing to access AddingItemsViewController")
        }
    //MARK: adding items into the list
    // insert into our events array
        shoppingList.insert(confirmingItem, at: 0) // at the top of the events array
    
    // create an indexPath to be INSERTED at the top of the tableView
    let indexPath = IndexPath(row: 0, section: 0)// will represent the top of the table view
    
    // use indexPath to insert into the tableView
        tableView.insertRows(at: [indexPath], with: .automatic)}
    
    
    //MARK: editing button
// ** MAKE SURE YOUR CRULY WIRES
        
        @IBAction func edutButtonPressed(_ sender: UIBarButtonItem) {
            isEditingTableView.toggle()
        }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shoppingList.count
    }
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath)
        let item = shoppingList[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
        
    }
 //MARK: DELETING ROWS IN A TABLE VIEW
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // EditingStyle ~ is an enum that had none, insert and delete
        
        switch editingStyle {
        case .insert:
            print("inserting...")
        case .delete:
            print("delteing....")
            // 1. remove item for the data model example event
            shoppingList.remove(at: indexPath.row) // removes events from array ~ internally~ within code// data
            
            // 2. update the table view
            tableView.deleteRows(at: [indexPath], with: .automatic) // removes from view
        default:
            print("......")
        }
    }
    
    //MARK: reordering row in a tableview
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let listToMove = shoppingList[sourceIndexPath.row] // save the event being moved
        shoppingList.remove(at: sourceIndexPath.row)
        
        shoppingList.insert(listToMove, at: destinationIndexPath.row)
        
    }

}

