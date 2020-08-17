//
//  Images.swift
//  AtEase
//
//  Created by Andrew Harris on 17/08/2020.
//  Copyright © 2020 Andrew Harris. All rights reserved.
//

import UIKit

enum WeatherType {
    case fire
    case flood
}

enum InformationType {
    case crime
    case weather(type: WeatherType)
}

struct Images {
    static let crime = UIImage(named: "shield.png")!
    static let flood = UIImage(named: "water.png")!
    static let fire = UIImage(named: "Fire.png")!
    
    static func getImage(forType type: InformationType) -> UIImage {
        switch  type  {
        case .crime:
            return crime
        case .weather(let type):
            switch type {
            case .fire : return fire
            case .flood: return flood
            }
        }
    }
}
