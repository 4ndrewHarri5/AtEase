//
//  MainCollectionViewCell.swift
//  AtEase
//
//  Created by Andrew Harris on 17/08/2020.
//  Copyright © 2020 Andrew Harris. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var body: UILabel!
    
    private var gradient: CAGradientLayer?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        background.layer.cornerRadius = 40
        background.layer.masksToBounds = true
        
        
    }
    
    override func layoutSubviews() {
        background.setGradientBackground(colours: [Colours.Warnings.goodOne.cgColor, Colours.Warnings.goodTwo.cgColor])
    }
    
}
