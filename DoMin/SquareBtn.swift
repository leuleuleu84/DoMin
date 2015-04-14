//
//  SquareBtn.swift
//  DoMin
//
//  Created by Thắng on 4/10/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit

class SquareBtn: UIButton {
    var square: Square!
    var dimension: CGFloat!
    var size: Size!
    let squareImage = UIImage(named: "square")
    let bomImage = UIImage(named: "bom")
    let flag = UIImage(named: "flag")
    
    init(square: Square, size: Size)
    {
        self.square = square
        self.size = size
        self.dimension = size.dimension
        var x = CGFloat(square.col) * size.dimension
        var y = CGFloat(square.row) * size.dimension
        var frame = CGRectMake(x, y, dimension, dimension)
        super.init(frame: frame)
        super.setBackgroundImage(squareImage , forState: UIControlState.Normal)
        
    }
    func getInfo(){
        if square.hasBom {
            super.setBackgroundImage(bomImage, forState: UIControlState.Normal)
        }
        else if square.numBomNear == 0 {
            super.setBackgroundImage(nil , forState: UIControlState.Normal)
            super.backgroundColor = UIColor.whiteColor()
        }
        else if square.numBomNear != 0{
            super.setTitle(String(square.numBomNear), forState: UIControlState.Normal)
        }
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}