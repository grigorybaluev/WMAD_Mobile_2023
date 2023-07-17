//
//  main.swift
//  n-queens_problem
//
//  Created by MacBook on 13.07.2023.
//

import Foundation

let boardSize = 8

var board = Board(size: boardSize)
var count = 0

func solveQueens(board: inout Board, onlyFirstSolution: Bool) {
  let boardSize = board.size
  var col = 0
  var row = 0
  if onlyFirstSolution {
    if solveQueensFirstHelper(board: &board, count: &count, col: col, row: row, boardSize: boardSize) {
      print(count, "recursive calls")
    }
    
  } else {
    solveQueensAllHelper(board: &board, count: &count, col: col, row: row, boardSize: boardSize)
    print(count, "final count")
  }
  
}

func solveQueensAllHelper(board: inout Board, count: inout Int, col: Int, row: Int, boardSize: Int) -> Board? {
  if row == boardSize {
    print(board)
    count += 1
    return board
  }
  
  for col in 0..<boardSize {
    if board.isSafe(row: row, col: col) {
      board.place(row: row, col: col)
      solveQueensAllHelper(board: &board, count: &count, col: col, row: row+1, boardSize: boardSize)
      board.remove(row: row, col: col)
    }
  }
  return nil
}

func solveQueensFirstHelper(board: inout Board, count: inout Int, col: Int, row: Int, boardSize: Int) -> Bool {
  if row == boardSize-1 && board.isSafe(row: row, col: col){
    print(board)
    return true
  }
  
  for col in 0..<boardSize {
    if board.isSafe(row: row, col: col) {
      board.place(row: row, col: col)
      count += 1
      solveQueensFirstHelper(board: &board, count: &count, col: col, row: row+1, boardSize: boardSize)
      board.remove(row: row, col: col)
    }
  }
  return false
  
}

solveQueens(board: &board, onlyFirstSolution: false
)

