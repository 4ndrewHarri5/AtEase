//
//  CrimeCollectionViewCell.swift
//  AtEase
//
//  Created by Andrew Harris on 17/08/2020.
//  Copyright © 2020 Andrew Harris. All rights reserved.
//

import UIKit

class CrimeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var bigTitle: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        background.layer.cornerRadius = 20
        
    }

}
