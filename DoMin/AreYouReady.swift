//
//  AreYouReady.swift
//  DoMin
//
//  Created by Thắng on 4/12/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit
class  AreYouReady : UIView {
    var viewAreYouReady = UIImageView(image: UIImage(named:"are_you_ready"))
    var imgBtnNormal = UIImage(named: "btnNormal")
    var imgBtnHighlighted = UIImage(named: "btnHighlighted")
    
    var btnYes: UIButton!
    var btnNo: UIButton!
    
    func makeBtn(center : CGPoint, title: String) -> UIButton{
        var temp = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        temp.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        temp.setBackgroundImage(imgBtnNormal, forState: UIControlState.Normal)
        temp.center = center
        temp.setTitle(title, forState: UIControlState.Normal)
        temp.setTitleColor (UIColor.whiteColor(), forState: UIControlState.Normal)
        
        return temp
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        var blurEffectView = UIView()
        blurEffectView.frame = super.frame
        blurEffectView.backgroundColor = UIColor.grayColor()
        blurEffectView.alpha = 0.7
        super.addSubview(blurEffectView)

        btnYes = makeBtn(CGPoint(x: super.bounds.width / 4,
            y: super.center.y + 70),
            title: "Let's go")
        btnNo = makeBtn(CGPoint(x: super.bounds.width * 3 / 4,
            y: super.center.y + 70 ),
            title: "Cancel")
        viewAreYouReady.bounds = CGRect(x: 0, y: 0, width: super.bounds.width, height: 150)
        viewAreYouReady.center = CGPoint(x: super.center.x, y: super.center.y - 100)
        println(viewAreYouReady.bounds)
        super.addSubview(btnYes)
        super.addSubview(btnNo)
        super.addSubview(viewAreYouReady)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}