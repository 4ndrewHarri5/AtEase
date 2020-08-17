//
//  DataService.swift
//  AtEase
//
//  Created by Andrew Harris on 17/08/2020.
//  Copyright © 2020 Andrew Harris. All rights reserved.
//

import Foundation

class DataService {
    
    func getData(completion: @escaping (String) -> Void)  {
        let url = URL(string: "http://www.google.com")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            completion(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
}
