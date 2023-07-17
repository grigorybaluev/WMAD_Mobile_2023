//
//  main.swift
//  n-queens_problem
//
//  Created by MacBook on 13.07.2023.
//

import Foundation

//print("Hello, World!")
//
let boardSize = 8

var board = Board(size: boardSize)
////var col = 0
//print(board.isSafe(row: 0, col: 0))
//board.place(row: 0, col: 0)


//for col in 0 ..< boardSize {
//
//  for row in 0 ..< boardSize {
//    print((col, row), board.isSafe(row: row, col: col))
//  }
//  print()
//}

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0

func solveQueens(board: inout Board) {

//  count += 1
  let boardSize = board.size
  var col = 0
  var row = 0
  solveQueensHelper(board: &board, count: &count, col: col, row: row, boardSize: boardSize)
  print(count, "final count")
}

//func solveQueens(board: inout Board) {
//
////  count += 1
//  let boardSize = board.size
//  var col = 0
//  var row = 0
//  if solveQueensHelper(board: &board, count: &count, col: &col, row: &row, boardSize: boardSize) {
//    print(board)
//  }
//  print(count, "final count")
//}

//func solveQueensHelper(board: inout Board, count: inout Int, col: inout Int, row: Int, boardSize: Int) {
//
//
//  for row in 0..<boardSize {
//    print("row: ", row, "col: ", col)
//
//    if col == boardSize - 1 && row == boardSize - 1 {
//  //    count -= 1
//  //    return true
//  //    col += 1
//      print("checkcheckcheckcheckcheckcheck")
//      return
//    }
//
//    if board.isSafe(row: row, col: col) {
//      print("safe move")
//      board.place(row: row, col: col)
//      print(board)
////      count += 1
////      print("count += 1")
//      col += 1
//      solveQueensHelper(board: &board, count: &count, col: &col, row: 0, boardSize: boardSize)
//      board.remove(row: row, col: col)
//    } else {
//      print("not safe")
//
//
//      board.place(row: row, col: col)
//      print(board)
//      board.remove(row: row, col: col)
//      if row == boardSize - 1 {
//
//        col -= 1
//        return
//      }
//    }
//  }
//
//
////  count += 1
////  return solveQueensHelper(board: &board, count: &count, boardSize: boardSize)
//}

//func solveQueensHelper(board: inout Board, count: inout Int, col: inout Int, row: inout Int, boardSize: Int) -> Bool {
//  if col == boardSize - 1 && row == boardSize - 1 {
//    print("last cell")
//    return false
//  }
//
//  if board.isSafe(row: row, col: col) {
//    print("check place")
//    board.place(row: row, col: col)
//    print(board)
//
//    if row == boardSize - 1 {
//      print("add col")
//      col += 1
//    } else if col == boardSize - 1 {
//      return false
//    } else {
//      print("add col")
//      col += 1
//      row = 0
//    }
//    print("start new solver")
//    print(col, row)
//    solveQueensHelper(board: &board, count: &count, col: &col, row: &row, boardSize: boardSize)
//    board.remove(row: row, col: col)
//  } else {
//    if row == boardSize - 1 {
//      col += 1
//    } else {
//      print("check not safe row += 1")
//      row += 1
//    }
//    print(col, row)
//    solveQueensHelper(board: &board, count: &count, col: &col, row: &row, boardSize: boardSize)
//  }
//  return true
//}

func solveQueensHelper(board: inout Board, count: inout Int, col: Int, row: Int, boardSize: Int) -> Board? {
  if row == boardSize {
    print(board)
    count += 1
    return board
  }
  
  for col in 0..<boardSize {
    if board.isSafe(row: row, col: col) {
//      print("check place")
      board.place(row: row, col: col)
//      print(board)
//      print("start new solver")
//      print(col, row)
      solveQueensHelper(board: &board, count: &count, col: col, row: row+1, boardSize: boardSize)
      board.remove(row: row, col: col)
    }
  }
//  count = 0
  return nil
}


//func solveQueensHelper(board: inout Board, count: inout Int, col: inout Int, row: inout Int, boardSize: Int) -> Bool {
//  if col == boardSize - 1 && row == boardSize - 1 {
//    if board.isSafe(row: row, col: col) {
//      board.place(row: row, col: col)
//      print(board)
//      return true
//    }
//    return false
//  }
//
//  for row in 0..<boardSize {
//    if board.isSafe(row: row, col: col) {
//      print("safe!!!!!")
//      board.place(row: row, col: col)
//      print(board)
//      var newBoard = Board(size: boardSize-1)
//      solveQueens(board: &newBoard)
//    } else {
//      print("not safe")
//
//    }
//  }
//  return false
//}

solveQueens(board: &board)

//print(board.isSafe(row: 1, col: 1))
//board.place(row: 1, col: 1)


//print(board)
