//
//  MainView.swift
//  DoMin
//
//  Created by Thắng on 4/12/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
    var btnNewGame : UIButton!
    var btnPause : UIButton!
    var board : UIView!

    func makeBtn(title: String, center : CGPoint) -> UIButton {
        var temp = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        temp.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        temp.center = center
        temp.setTitle(title, forState: UIControlState.Normal)
        temp.setTitleColor (UIColor.blueColor(), forState: UIControlState.Normal)
        
        return temp
    }
    
    var lbTime : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        lbTime = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        lbTime.center = CGPoint (x: super.bounds.width / 2, y: 35)
        lbTime.text = ""
        lbTime.textAlignment = NSTextAlignment.Center
        super.addSubview(lbTime)
        
        board = UIView(frame: CGRect(x: 15, y: 60, width: super.bounds.width - 30 , height: super.bounds.height - 120))
        super.addSubview(board)
        
        
        btnNewGame = makeBtn("New Game", center: CGPoint(x: super.bounds.width / 4, y: super.bounds.height - 40))
        btnPause = makeBtn("Pause", center: CGPoint(x: super.bounds.width * 3 / 4, y: super.bounds.height - 40))
        super.addSubview(btnNewGame)
        super.addSubview(btnPause)
        
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}