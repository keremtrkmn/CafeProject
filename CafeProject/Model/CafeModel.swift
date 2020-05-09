//
//  CafeModel.swift
//  CafeProject
//
//  Created by Appendix on 29.04.2020.
//  Copyright © 2020 Appendix. All rights reserved.
//

import Foundation

struct Cafe{
    
    var cafeName : String
    var cafeLocation : String
    var cafeAddress : String
    var cafePage : String
    var cafeWorkingHours : String
    var cafeLogo : String
    var cafeDetail : String
    var cafeOrder : Int
    
    init(cafeLogo: String, cafeName : String = "", cafeLocation : String = "", cafeAddress : String = "", cafePage : String = "", cafeWorkingHours : String = "", cafeDetail : String = "", cafeOrder : Int = 0) {
        self.cafeLogo = cafeLogo
        self.cafeName = cafeName
        self.cafeLocation = cafeLocation
        self.cafeAddress = cafeAddress
        self.cafePage = cafePage
        self.cafeWorkingHours = cafeWorkingHours
        self.cafeDetail = cafeDetail
        self.cafeOrder = cafeOrder
    }
    
}
