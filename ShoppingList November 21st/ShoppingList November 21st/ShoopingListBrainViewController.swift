//
//  ShoopingListBrainViewController.swift
//  ShoppingList November 21st
//
//  Created by Margiett Gil on 11/25/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import UIKit

    struct ShoppingItem {
        var name: String
        var wasPurchased: Bool
        
        static var groceries = [
            ShoppingItem(name: "avacado", wasPurchased: false),
            ShoppingItem(name: "chips", wasPurchased: true)
        ]
       
        
    }
