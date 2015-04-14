//
//  Size.swift
//  DoMin
//
//  Created by Thắng on 4/10/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit
class Size {
    
    var numbSquareWidth : Int = 14
    var dimension: CGFloat!
    var numbSquareHeight : Int = 15
    var max : Int = 14 * 15
    
    init(numbSquareWidth: Int, bound : CGRect)
    {
        
        self.numbSquareWidth = numbSquareWidth
        self.dimension = bound.width / CGFloat(numbSquareWidth)
        self.numbSquareHeight = Int(bound.height / dimension)
        self.max = numbSquareWidth * numbSquareHeight
    }
    
}