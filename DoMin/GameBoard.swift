//
//  GameBoard.swift
//  DoMin
//
//  Created by Thắng on 4/11/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit

class GameBoard {
    var size: Size!
    var squares = [Square]()
    var level : Int
    var totalBomb = {(level: Int) -> Int in
        return level * 4
    }
    var bombRemind : Int!
    var bombsIndex = {(totalBomb: Int, max: Int) -> [Int]? in
        if (totalBomb < max){
            var array = [Int]()
            for i in 0 ..< max
            {
                array.append(i)
            }
            for i in 0 ..< max
            {
                var other = Int(arc4random_uniform(UInt32(max - 1)))
                var temp = array[i]
                array[i] = array[other]
                array[other] = temp
            }
            var subArray = [Int]()
            for i in 0 ..< totalBomb
            {
                subArray.append(array[i])
            }
            return subArray
        }
        return nil
    }
    init(size: Size, level: Int){
        self.size = size
        self.level = level
    }
    func resetGameBoard(){
        squares = [Square]()
        bombRemind = totalBomb(level)
        makeGameBoard()
        
    }
    
    func makeGameBoard(){
        
        for i in 0 ..< size.max {
            var square = Square(squareIndex: i, size: size)
            squares.append(square)
        }
        
        
        for i in bombsIndex(totalBomb(level), size.max)! {
            squares[i].hasBom = true
            makeNumBomNear(squares, i: i)
        }
    }
    func makeNumBomNear(squareArray: [Square], i: Int){
        let offset = [[-1,-1], [-1,0], [-1,1],
            [0,-1],[0,1],
            [1,-1],[1,0],[1,1]]
        for j in offset {
            var col = squareArray[i].col + j[1]
            var row = squareArray[i].row + j[0]
            if (col >= 0 && col < size.numbSquareWidth && row >= 0 && row < size.numbSquareHeight)
            {
                squareArray[row * size.numbSquareWidth + col].numBomNear++
                
            }
        }
    }
}