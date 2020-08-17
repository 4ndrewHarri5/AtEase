//
//  HomeViewController.swift
//  AtEase
//
//  Created by Andrew Harris on 17/08/2020.
//  Copyright © 2020 Andrew Harris. All rights reserved.
//

import UIKit
import MagazineLayout

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let rawData = Home(
        postcode: "XXXXXX",
        score: 72,
        crimes: [
            Crime(bigTitle: "2", body: "crimes commited recently")
        ],
        weather: [
            Weather(title: "Fires", body: "Your not likely to have any fires", percent: 5, type: .fire),
            Weather(title: "Floods", body: "Your not likely to have any floods", percent: 1, type: .flood)
        ])
    
    var data: [[Cell]] {
        get {
           rawData.getDataInCells()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 20, right: 0)
        
        let layout = MagazineLayout()
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: "WeatherCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "weatherCell")
        
        collectionView.register(UINib(nibName: "CrimeCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "crimeCell")
        
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "mainCell")
        
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "mainCell")
        
        collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: .main), forSupplementaryViewOfKind: MagazineLayout.SupplementaryViewKind.sectionHeader, withReuseIdentifier: "headerCell")

        
        collectionView.register(UINib(nibName: "TitleHeaderCollectionReusableView", bundle: .main), forSupplementaryViewOfKind: MagazineLayout.SupplementaryViewKind.sectionHeader, withReuseIdentifier: "titleHeaderCell")


        collectionView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        
        collectionView.dataSource = self
        collectionView.delegate = self

        
        // Do any additional setup after loading the view.
    }

}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if data[indexPath.section][indexPath.row] is MainCell {
            let mainCell = data[indexPath.section][indexPath.row] as! MainCell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as? MainCollectionViewCell else { fatalError() }
            cell.layer.applyShadow()
            cell.layer.masksToBounds = false
            
            cell.title.text = mainCell.title
            cell.body.text = mainCell.body
            cell.percent.text = String(mainCell.score)
            
            return cell
        }else if data[indexPath.section][indexPath.row] is HalfCell {
            let halfCell = data[indexPath.section][indexPath.row] as! HalfCell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "crimeCell", for: indexPath) as? CrimeCollectionViewCell else { fatalError() }
            
            cell.bigTitle.text = halfCell.bigTitle
            cell.body.text = halfCell.body
            cell.icon.image = halfCell.image
            
            return cell
        }else {
            let fullCell = data[indexPath.section][indexPath.row] as! FullCell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCollectionViewCell else { fatalError() }
            
            cell.title.text = fullCell.title
            cell.body.text = fullCell.body
            cell.icon.image = fullCell.image
            cell.percent.text = String(fullCell.percentage)
            
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if data[indexPath.section][indexPath.row] is MainCell {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "titleHeaderCell",
                    for: indexPath) as? TitleHeaderCollectionReusableView
                  else {
                    fatalError("Invalid view type")
                }
                headerView.title.text = "Your home"
                headerView.postcode.text = rawData.postcode
                return headerView
            }else if data[indexPath.section][indexPath.row] is HalfCell {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "headerCell",
                    for: indexPath) as? HeaderCollectionReusableView
                  else {
                    fatalError("Invalid view type")
                }
                headerView.title.text = "What is happening?"
                return headerView
            }else if data[indexPath.section][indexPath.row] is FullCell {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "headerCell",
                    for: indexPath) as? HeaderCollectionReusableView
                  else {
                    fatalError("Invalid view type")
                }
                headerView.title.text = "Extreme weather"
                return headerView
            }else{
                guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "headerCell",
                    for: indexPath) as? HeaderCollectionReusableView
                  else {
                    fatalError("Invalid view type")
                }
                headerView.title.text = "unknown"
                return headerView
            }
    }
    
}

extension HomeViewController: UICollectionViewDelegateMagazineLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeModeForItemAt indexPath: IndexPath) -> MagazineLayoutItemSizeMode {
        var widthMode = MagazineLayoutItemWidthMode.fullWidth(respectsHorizontalInsets: true)
        
        if data[indexPath.section][indexPath.row] is HalfCell {
            widthMode = MagazineLayoutItemWidthMode.halfWidth
        }
        
        let heightMode = MagazineLayoutItemHeightMode.dynamicAndStretchToTallestItemInRow
        return MagazineLayoutItemSizeMode(widthMode: widthMode, heightMode: heightMode)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, visibilityModeForHeaderInSectionAtIndex index: Int) -> MagazineLayoutHeaderVisibilityMode {
        return .visible(heightMode: .dynamic, pinToVisibleBounds: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, visibilityModeForFooterInSectionAtIndex index: Int) -> MagazineLayoutFooterVisibilityMode {
        return .hidden
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, visibilityModeForBackgroundInSectionAtIndex index: Int) -> MagazineLayoutBackgroundVisibilityMode {
            return .hidden

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, horizontalSpacingForItemsInSectionAtIndex index: Int) -> CGFloat {
            return  12

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, verticalSpacingForElementsInSectionAtIndex index: Int) -> CGFloat {
            return  12

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetsForSectionAtIndex index: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetsForItemsInSectionAtIndex index: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 0, bottom: 10, right: 0)
    }
}


