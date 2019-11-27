//
//  ZooAnimalListViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Margiett Gil on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class ZooAnimalListViewController: UIViewController {

 @IBOutlet weak var tableView: UITableView!
    

    var didSetAnimal = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()

        }
    }
   override func viewDidLoad() {
         super.viewDidLoad()
    
    didSetAnimal = ZooAnimal.getAnimals()

    tableView.dataSource = self
    tableView.delegate = self

}
   //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //code
        guard let animalVC = segue.destination as? DetailViewController,let indexPath = tableView.indexPathForSelectedRow else {

            return
        }
        animalVC.animal = didSetAnimal[indexPath.section][indexPath.row]
             
             print("preparForSegue")

}
}

extension ZooAnimalListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        didSetAnimal[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else {
            
            //explicity crashed the app at runtime if a countryCell does not exist, this is a developer error
         fatalError("Couldn't dequeue a AnimalCell")
            
        }
        let animalSet = didSetAnimal[indexPath.section][indexPath.row]
                
                //configure the country cell
        cell.configuringCell(for: animalSet)
        

                return cell
                
            }
            
            func numberOfSections(in tableView: UITableView) -> Int {
                return didSetAnimal.count // 5
            }
    
//     this addes the header so common it out
            func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
                return didSetAnimal[section].first?.classification
    }
          
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
        }

    
    
