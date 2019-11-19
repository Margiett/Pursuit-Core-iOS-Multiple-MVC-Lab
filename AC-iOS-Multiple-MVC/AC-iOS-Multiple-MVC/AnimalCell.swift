//
//  AnimalCell.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Margiett Gil on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {

    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalOriginLabel: UILabel!
    
    
    override func layoutSubviews() {
    super.layoutSubviews()
    
}
    func configuringCell(for animals: ZooAnimal) {
        animalImageView.image = UIImage(named: "\(animals.imageNumber)")
        animalNameLabel.text = animals.name
        animalOriginLabel.text = animals.origin
    }
}
