//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var zooAnimalImageViewVC: UIImageView!
    @IBOutlet weak var zooAnimalsLabelVC: UILabel!
    @IBOutlet weak var zooAnimalTextView: UITextView!
    
    var animal: ZooAnimal?
    
    
    override func viewDidLoad() {
             super.viewDidLoad()
             UpdateUI()
         }
    
    func UpdateUI()  {
        guard let theAnimal = animal else {
            fatalError("Couldnt get Animal origin")
        
        }
        title = theAnimal.name
        zooAnimalImageViewVC.image = UIImage(named: theAnimal.imageNumber.description)
        
        zooAnimalsLabelVC.text = theAnimal.name
        
        zooAnimalTextView.text = theAnimal.info
        
        
    }

}

