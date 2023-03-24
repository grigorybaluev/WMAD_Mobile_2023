//
//  Piece.swift
//  Lab_2_Chess
//
//  Created by MacBook on 24.03.2023.
//

import Foundation

class Piece: CustomStringConvertible {
    var description: String {
        return ""
    }
    private var value: Int
    private (set) var isWhite: Bool
    
    init(value: Int, isWhite: Bool = false) {
        self.value = value
        self.isWhite = isWhite
    }
    
    func getValue() -> Int {
        return value
    }
    
    func setValue(newValue: Int) {
        value = newValue
    }
    
    func move() -> Void {
        return
    }
}

class Pawn: Piece {
    override var description: String {
        return "Pawn(value=" + String(self.getValue()) + ")"
    }
    
    override func move() {
        print("Forward 1")
        return
    }
}

class Knight: Piece {
    override var description: String {
        return "Knight(value=" + String(self.getValue()) + ")"
    }
    
    override func move() {
        print("Like an L")
        return
    }
}

class Bishop: Piece {
    override var description: String {
        return "Bishop(value=" + String(self.getValue()) + ")"
    }
    
    override func move() {
        print("Diagonally")
        return
    }
}

class Rook: Piece {
    override var description: String {
        return "Pawn(value=" + String(self.getValue()) + ")"
    }
    
    override func move() {
        print("Horizontally or vertically")
        return
    }
}

class Queen: Piece {
    override var description: String {
        return "Queen(value=" + String(self.getValue()) + ")"
    }
    
    override func move() {
        print("Like bishop and rook")
        return
    }
}

class King: Piece {
    override var description: String {
        return "King(value=" + String(self.getValue()) + ")"
    }
    
    override func move() {
        print("One square")
        return
    }
}
