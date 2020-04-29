//
//  CafeListCell.swift
//  CafeProject
//
//  Created by Appendix on 29.04.2020.
//  Copyright © 2020 Appendix. All rights reserved.
//

import UIKit

class CafeListCell: UICollectionViewCell {
    
    // MARK: Outlet
    
    @IBOutlet weak var cafeImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var cafeNameLabel: UILabel!
    
    
    func prepareCell(cafe: Cafe) {
        layer.cornerRadius = 25
        cafeImage.layer.borderWidth = 3
        cafeImage.layer.borderColor = UIColor(red: 0.365, green: 0.263, blue: 0.216, alpha: 1).cgColor
        cafeImage.layer.cornerRadius = 55
        cafeImage.clipsToBounds = true
        cafeImage.image = UIImage(named: cafe.cafeLogo)
        cafeNameLabel.text = cafe.cafeName
    }
        
}
