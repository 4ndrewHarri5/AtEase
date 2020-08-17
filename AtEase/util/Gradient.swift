//
//  Gradient.swift
//  AtEase
//
//  Created by Andrew Harris on 17/08/2020.
//  Copyright © 2020 Andrew Harris. All rights reserved.
//

import UIKit

extension UIView {
    
    func setGradientBackground(colours: [CGColor]) {
           
           var gradientLayer = CAGradientLayer()
           if let sublayers = layer.sublayers {
               for sublayer in sublayers {
                   if let gLayer = sublayer as? CAGradientLayer {
                       gradientLayer = gLayer
                       break
                   }
               }
           }
           gradientLayer.frame = bounds
           gradientLayer.colors = colours
           gradientLayer.locations = [0.0, 1.0]
           gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
           gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
           layer.insertSublayer(gradientLayer, at: 0)
    
       }
    
}
