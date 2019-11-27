//
//  AddingItemsViewController.swift
//  ShoppingList November 21st
//
//  Created by Margiett Gil on 11/25/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import UIKit

class AddingItemsViewController: UIViewController {

      @IBOutlet weak var textField: UITextField!
    
    
    // this takes in the item from the array of shoppinglist from the viewController
        var newItem: ShoppingItem?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            //MARK: Delegate textField
            textField.delegate = self
            
            newItem = ShoppingItem(name: "avocado", wasPurchased: false)
        }
    }
    extension AddingItemsViewController: UITextFieldDelegate{
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            // dismiss the textfield
            textField.resignFirstResponder()
            // update the name of 
            newItem?.name = textField.text ?? "avacado"
            newItem?.wasPurchased = false
            
            return true
        }
        
    }
