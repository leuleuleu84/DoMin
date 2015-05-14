//
//  GameOverView.swift
//  DoMin
//
//  Created by Thắng on 4/13/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit
class GameOverView: UIView {
    var gameOverView = UIImageView(image: UIImage(named: "gameOver"))
    var continousBtn = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        var whyBtn = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    var img = UIImage(named: "btnNormal")

    override init(frame: CGRect) {
        super.init(frame: frame)
        var blurEffectView = UIView()
        blurEffectView.frame = super.frame
        blurEffectView.backgroundColor = UIColor.grayColor()
        blurEffectView.alpha = 0.7
        super.addSubview(blurEffectView)
        
        gameOverView.center = CGPoint(x: super.center.x, y: super.center.y - 100)
        super.addSubview(gameOverView)
        
        continousBtn.setBackgroundImage(img, forState: UIControlState.Normal)
        continousBtn.frame.size = CGSize(width: 100, height: 40)
        continousBtn.center = CGPoint(x: super.bounds.width / 4, y: super.center.y + 50)
        continousBtn.setTitle("Continue", forState: UIControlState.Normal)
        super.addSubview(continousBtn)
        
        whyBtn.setBackgroundImage(img, forState: UIControlState.Normal)
        whyBtn.frame.size = CGSize(width: 100, height: 40)
        whyBtn.center = CGPoint(x: super.bounds.width * 3 / 4, y: super.center.y + 50)
        whyBtn.setTitle("Why?", forState: UIControlState.Normal)
        super.addSubview(whyBtn)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}