//
//  Square.swift
//  DoMin
//
//  Created by Thắng on 4/10/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
class Square {
    var col: Int = 0
    var row: Int = 0
    var isReavel : Bool = false
    var hasBom : Bool = false
    var numBomNear : Int = 0
    var mayhasBom : Bool = false
    var id : Int = 0
    init (col: Int, row : Int, size : Size) {
        self.col = col
        self.row = row
        self.id = row * size.numbSquareWidth + col
    }
    init (squareIndex: Int, size : Size)
    {
        self.col = squareIndex % size.numbSquareWidth
        self.row = squareIndex / size.numbSquareWidth
        self.id = squareIndex
    }
    func resetSquare()
    {
        isReavel  = false
        hasBom = false
        numBomNear = 0
        mayhasBom = false
    }
    
    
}