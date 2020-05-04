//
//  SecondaryLabel.swift
//  CafeProject
//
//  Created by Appendix on 5.05.2020.
//  Copyright © 2020 Appendix. All rights reserved.
//

import UIKit

class SecondaryLabel: UILabel {

    var _fontSize: CGFloat! = 18
      
    @IBInspectable var fontSize: CGFloat {
        get {return _fontSize}
        set {_fontSize = newValue}
      }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let font = UIFont(name: "Montserrat-Regular", size: fontSize)
        self.font = font
      }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
      
}
