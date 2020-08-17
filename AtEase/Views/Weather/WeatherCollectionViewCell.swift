//
//  WeatherCollectionViewCell.swift
//  AtEase
//
//  Created by Andrew Harris on 17/08/2020.
//  Copyright © 2020 Andrew Harris. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        background.layer.cornerRadius = 20
        
    }

}
