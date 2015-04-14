//
//  BtnNewgame.swift
//  DoMin
//
//  Created by Thắng on 4/10/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit

class Button : UIButton{
    var button : UIButton
    var point : CGPoint
    

    init(center: CGPoint){
        point = center
        button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        var bound = CGRect(x: 0, y: 0, width: 150, height: 40)
        super.init(frame: bound)
        super.center = point
        super.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        super.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
    }
    


    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}