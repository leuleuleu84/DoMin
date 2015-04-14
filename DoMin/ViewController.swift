//
//  ViewController.swift
//  DoMin
//
//  Created by Thắng on 4/10/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: NSTimer?
    var totalTime: Int = 4 * 60
    var mainView : MainView!
    var pauseView : PauseView!
    var currentTime = Time() {
        didSet {
            self.mainView.lbTime.text = currentTime.toString()
        }
    }
    var btnNewgame : Button!
    
    var boardSize: Size!
    //    var square : Square!
    var squareBtn: SquareBtn!
    var gameBoard: GameBoard!
    var btns = [SquareBtn]()
    var numberOfFlag = 0
    var tmpTime :Int!
    
    func updateTime(){
        tmpTime!--
        if (tmpTime >= 0)
        {
            currentTime = Time(second: tmpTime)
        }
        else { gameover()}
        
        
    }
    func continueGame(sender: UIButton){
        sender.superview?.removeFromSuperview()
        startNewGame()
    }
    func why(sender: UIButton){
        sender.superview?.removeFromSuperview()
        reavelAll()
    }
    func gameover(){
        if timer != nil {
            timer!.invalidate()
        }
        timer = nil
        
        var gameover = GameOverView(frame: view.frame)
        gameover.center = view.center
        view.addSubview(gameover)
        gameover.continousBtn.addTarget(self, action: "continueGame:", forControlEvents: UIControlEvents.TouchDown)
        gameover.whyBtn.addTarget(self, action: "why:", forControlEvents: UIControlEvents.TouchDown)
        
    }
    func youWin(){
        if timer != nil {
            timer!.invalidate()
        }
        timer = nil
        var youWinView = YouWinView(frame: view.frame)
        youWinView.center = view.center
        view.addSubview(youWinView)
        youWinView.continousBtn.addTarget(self, action: "continueGame:", forControlEvents: UIControlEvents.TouchDown)
        
    }
    func startNewGame(){
        tmpTime = totalTime
        numberOfFlag = 0

        resetAllThing()
        if (timer == nil) {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        }
        initialation()
    }
    func btnIsPressed(sender: SquareBtn){
        if !sender.square.isReavel {
            sender.square.isReavel = true
            sender.getInfo()
            if sender.square.numBomNear == 0 {
                reavelEmpty(sender)
            }
            if sender.square.hasBom {
                gameover()
            }
        }
    }
    func reavelEmpty(sender: SquareBtn){
        let offset = [[-1,-1], [-1,0], [-1,1],
            [0,-1],[0,1],
            [1,-1],[1,0],[1,1]]
        for j in offset {
            var col = sender.square.col + j[1]
            var row = sender.square.row + j[0]
            
            if (col >= 0 && col < boardSize.numbSquareWidth && row >= 0 && row < boardSize.numbSquareHeight) {
                var id = row * boardSize.numbSquareWidth + col
                if gameBoard.squares[id].numBomNear == 0 {
                    
                    btnIsPressed(btns[id])
                    
                }
            }
        }
    }
    func maybeBomb(sender : SquareBtn){
        if sender.backgroundImageForState(UIControlState.Normal) != sender.flag {
            sender.setBackgroundImage(sender.flag, forState: UIControlState.Normal)
            sender.square.mayhasBom = true
            if (sender.square.mayhasBom == sender.square.hasBom){
                gameBoard.bombRemind! -= 1
            }
            numberOfFlag++
            
        }
        else {
            sender.setBackgroundImage(sender.squareImage, forState: UIControlState.Normal)
            if (sender.square.mayhasBom == sender.square.hasBom){
                gameBoard.bombRemind! += 1
            }
            sender.square.mayhasBom = false
            numberOfFlag--
        }
        if (numberOfFlag == gameBoard.totalBomb(gameBoard.level) && gameBoard.bombRemind == 0){
            youWin()
        }
        
    }
    func initialation(){
        for i in 0 ..< boardSize.max
        {
            squareBtn = SquareBtn(square: gameBoard.squares[i], size: boardSize)
            squareBtn.addTarget(self, action: "btnIsPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            squareBtn.addTarget(self, action: "maybeBomb:", forControlEvents: UIControlEvents.TouchDragExit)
            mainView.board.addSubview(squareBtn)
            btns.append(squareBtn)
        }
        
    }
    func resetAllThing(){
        gameBoard.resetGameBoard()
        btns = [SquareBtn]()
        if timer != nil {
            timer!.invalidate()
        }
        timer = nil
    }
    func reavelAll(){
        for i in btns
        {
            i.getInfo()
        }
    }
    func ready(sender: UIButton){
        var superview = sender.superview
        superview?.removeFromSuperview()
        startNewGame()
    }
    func dismissLayer(btnPause : UIButton){
        var layer = btnPause.superview
        layer?.removeFromSuperview()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        
    }
    
    func pause(sender : UIButton){
        if timer != nil {
            timer!.invalidate()
            timer = nil
            pauseView = PauseView (frame: view.frame)
            view.addSubview(pauseView)
            pauseView.btnPause.addTarget(self, action: "dismissLayer:", forControlEvents: UIControlEvents.TouchDown)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = MainView(frame: view.frame)
        view.addSubview(mainView)
        boardSize = Size(numbSquareWidth: 7, bound: mainView.board.bounds)
        gameBoard = GameBoard(size: boardSize, level: 1)
        
        mainView.btnNewGame.addTarget(self, action: "startNewGame", forControlEvents: UIControlEvents.TouchUpInside)
        mainView.btnPause.addTarget(self, action: "pause:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var areYouReady = AreYouReady(frame: view.frame)
        areYouReady.center = view.center
        areYouReady.btnYes.addTarget(self, action: "ready:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(areYouReady)
        //
    }
    
    //    override func viewDidAppear(animated: Bool) { super.viewDidAppear(animated)
    //        self.presentViewController(readyAlert!, animated: true, completion: nil)
    //    }
    
}

