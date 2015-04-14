//
//  GameOverView.swift
//  DoMin
//
//  Created by Thắng on 4/13/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit
class YouWinView: UIView {
    var youWinView = UIImageView(image: UIImage(named: "win"))
    var continousBtn = UIButton.buttonWithType(UIButtonType.System) as! UIButton

    var img = UIImage(named: "btnNormal")
    var blurEffect = UIBlurEffect(style: UIBlurEffectStyle(rawValue: 2)!)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = super.frame
        super.addSubview(blurEffectView)
        
        youWinView.center = CGPoint(x: super.center.x, y: super.center.y - 100)
        super.addSubview(youWinView)
        
        continousBtn.setBackgroundImage(img, forState: UIControlState.Normal)
        continousBtn.frame.size = CGSize(width: 100, height: 40)
        continousBtn.center = CGPoint(x: super.bounds.width / 2, y: super.center.y + 50)
        continousBtn.setTitle("Continue", forState: UIControlState.Normal)
        super.addSubview(continousBtn)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}