//
//  Piece.swift
//  Lab_2_Chess
//
//  Created by MacBook on 24.03.2023.
//

import Foundation

class Piece: CustomStringConvertible {
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
    
}

extension Piece {
    var description: String {
        return ""
    }
}
