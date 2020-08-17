//
//  Home.swift
//  AtEase
//
//  Created by Andrew Harris on 17/08/2020.
//  Copyright © 2020 Andrew Harris. All rights reserved.
//

import Foundation

class Home {
    
    var postcode: String
    var score: Int
    var crimes: [Crime]
    var weather: [Weather]
    
    init(postcode: String, score: Int, crimes: [Crime], weather: [Weather]) {
        self.postcode  = postcode
        self.score = score
        self.crimes = crimes
        self.weather = weather
    }
    
    func getDataInCells() -> [[Cell]] {
        var data = [[Cell]]()
        data.append([MainCell(title: "Your area saftey score", score: score, body: "Based off what is going on in your area")])
        
        let cellCrimes = crimes.map { (crime) -> HalfCell in
            HalfCell(bigTitle: crime.bigTitle, body: crime.body, image: Images.getImage(forType: .crime))
        }
        data.append(cellCrimes)
        
        let cellWeather = weather.map { (weather) -> FullCell in
            FullCell(title: weather.title, body: weather.body, percentage: weather.percent, image: Images.getImage(forType: InformationType.weather(type: weather.type)))
        }
        data.append(cellWeather)
        return data
    }
    
}
