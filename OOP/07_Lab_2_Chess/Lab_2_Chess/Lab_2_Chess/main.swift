//
//  main.swift
//  Lab_2_Chess
//
//  Created by MacBook on 24.03.2023.
//

import Foundation

let p1 = Pawn(value: 1, isWhite: true, promoted: true, newPiece: .Queen)
let p2 = Pawn(value: 1, isWhite: true, promoted: false, newPiece: nil)
let p3 = Pawn(value: 1, isWhite: false, promoted: false, newPiece: nil)
let p4 = Pawn(value: 1, isWhite: false, promoted: true, newPiece: .Queen)
let p5 = Pawn(value: 1, isWhite: true, promoted: true, newPiece: .Knight)

print(p1 == p2)
print(p1 == p4)
print(p1 == p5)
print(p2 == p3)
print(p4 == p5)

