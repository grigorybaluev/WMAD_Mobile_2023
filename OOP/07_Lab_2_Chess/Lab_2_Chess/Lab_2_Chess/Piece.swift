//
//  Piece.swift
//  Lab_2_Chess
//
//  Created by MacBook on 24.03.2023.
//

import Foundation

class Piece: CustomStringConvertible, Equatable {
    
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
    
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        return lhs.value == rhs.value && lhs.isWhite == rhs.isWhite
    }
}

class Pawn: Piece {
    override var description: String {
        return "Pawn(value=" + String(self.getValue()) + ")"
    }
    
    private (set) var promoted: Bool = false
    private (set) var newPiece: Piece? = nil
    
    init(value: Int, isWhite: Bool, promoted: Bool, newPiece: promotionNewPiece?) {
        self.promoted = promoted
        switch newPiece {
        case .Queen:
            self.newPiece = Queen(isWhite: isWhite)
        case .Rook:
            self.newPiece = Rook(isWhite: isWhite)
        case .Bishop:
            self.newPiece = Bishop(isWhite: isWhite)
        case .Knight:
            self.newPiece = Knight(isWhite: isWhite)
        default:
            self.newPiece = nil
        }
        super.init(value: value, isWhite: isWhite)
    }
    
    override func move() {
        print("Forward 1")
        return
    }
    
    static func == (lhs: Pawn, rhs: Pawn) -> Bool {
        return lhs.getValue() == rhs.getValue() && lhs.isWhite == rhs.isWhite && lhs.promoted == rhs.promoted && lhs.newPiece == rhs.newPiece
    }
}

extension Pawn {
    enum promotionNewPiece {
        case Queen
        case Rook
        case Bishop
        case Knight
    }
}

class Knight: Piece {
    override var description: String {
        return "Knight(value=" + String(self.getValue()) + ")"
    }
    
    init(isWhite: Bool) {
        super.init(value: 2, isWhite: isWhite)
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
    
    init(isWhite: Bool) {
        super.init(value: 3, isWhite: isWhite)
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
    
    init(isWhite: Bool) {
        super.init(value: 5, isWhite: isWhite)
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
    
    init(isWhite: Bool) {
        super.init(value: 9, isWhite: isWhite)
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
