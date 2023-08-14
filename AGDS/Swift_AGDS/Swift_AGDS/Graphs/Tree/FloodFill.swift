//
//  FloodFill.swift
//  Swift_AGDS
//
//  Created by MacBook on 14.08.2023.
//

import Foundation

func tomatoFarm() {
  
  struct Square {
    let x: Int
    let y: Int
  }
  
  var (numCols, numRows) = (0, 0)
  let input = readLine()!.split(separator: " ").map( { Int($0)} )
  var farm = [[Int]]()
  if let cols = input[0], let rows = input[1] {
    (numCols, numRows) = (cols, rows)
  }

  for _ in 0..<numRows {
    let line = readLine()!.split(separator: " ").map( {Int($0)!} )
    farm.append(line)
  }
  
  var queue: [Square] = []
  var freshTomatoes = 0
  var days = 0
  
  for row in 0..<numRows {
    for col in 0..<numCols {
      if farm[row][col] == 1 {
        queue.append(Square(x: col, y: row))
      } else if farm[row][col] == 0 {
        freshTomatoes += 1
      }
    }
  }
  
  queue.append(Square(x: -1, y: -1))
  
  let directions: [(Int, Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
  
  while !queue.isEmpty {
    let front = queue.removeFirst()
    
    if front.x == -1 && front.y == -1 {
      days += 1
      
      if !queue.isEmpty {
        queue.append(Square(x: -1, y: -1))
      }
    } else {
      for dir in directions {
        let newCol = front.x + dir.1
        let newRow = front.y + dir.0
        
        if newRow >= 0 && newRow < numRows && newCol >= 0 && newCol < numCols &&
            farm[newRow][newCol] == 0 {
          farm[newRow][newCol] = 1
          freshTomatoes -= 1
          queue.append(Square(x: newCol, y: newRow))
        }
      }
    }
  }
  
  print(freshTomatoes == 0 ? days - 1 : -1)
}

func bridges() {
  let n = Int(readLine()!)!
  var (numCols, numRows) = (n, n)
  var grid = [[Int]]()

  for _ in 0..<numRows {
    let line = readLine()!.split(separator: " ").map( {Int($0)!} )
    grid.append(line)
  }
  
  let directions: [(Int, Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
  var foundIsland = false
  
  func dfs(_ row: Int, _ col: Int) {
    if row < 0 || row >= numRows || col < 0 || col >= numCols || grid[row][col] != 1 {
      return
    }
    grid[row][col] = -1
    
    for dir in directions {
      dfs(row + dir.0, col + dir.1)
    }
  }
  
  for row in 0..<numRows {
    for col in 0..<numCols {
      if grid[row][col] == 1 {
        dfs(row, col)
        foundIsland = true
        break
      }
    }
    if foundIsland {
      break
    }
  }
  
  var queue = Queue<(Int, Int, Int)>()
  var visited = Array(repeating: Array(repeating: false, count: numCols), count: numRows)
  
  for row in 0..<numRows {
    for col in 0..<numCols {
      if grid[row][col] == -1 {
        queue.enqueue(item: (row, col, 0))
        visited[row][col] = true
      }
    }
  }
  
  while queue.count != 0 {
    let (row, col, steps) = queue.dequeue()!
    
    for dir in directions {
      let newRow = row + dir.0
      let newCol = col + dir.1
      
      if newRow >= 0 && newRow < numRows && newCol >= 0 && newCol < numCols {
        if grid[newRow][newCol] == 1 {
          print(steps)
          return
        }
        
        if !visited[newRow][newCol] {
          queue.enqueue(item: (newRow, newCol, steps + 1))
          visited[newRow][newCol] = true
        }
      }
    }
  }
  
  print(-1)
}


