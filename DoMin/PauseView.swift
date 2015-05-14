//
//  PauseView.swift
//  DoMin
//
//  Created by Thắng on 4/13/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit
class PauseView: UIView {
    
    var btnPause =  UIButton.buttonWithType(UIButtonType.System) as! UIButton
    var playImg = UIImage(named: "play")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var blurEffectView = UIView()
        blurEffectView.frame = super.frame
        blurEffectView.backgroundColor = UIColor.blackColor()
        
        btnPause.frame.size = CGSize(width: 80, height: 80)
        btnPause.setBackgroundImage(playImg, forState: UIControlState.Normal)
        btnPause.center = super.center
        super.addSubview(blurEffectView)
        super.addSubview(btnPause)


    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
