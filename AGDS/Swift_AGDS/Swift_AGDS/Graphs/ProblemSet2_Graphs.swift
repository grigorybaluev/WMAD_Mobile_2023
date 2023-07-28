//
//  ProblemSet2_Graphs.swift
//  Swift_AGDS
//
//  Created by MacBook on 28.07.2023.
//

import Foundation



func cyclicPermutation() {
  let nOfTests = readLine()!.split(separator: " ")[0]
  
  for _ in 0..<Int(nOfTests)! {
    let sizeOfPermutation = Int(readLine()!)!
    var permuation: [Int] = []
    for i in readLine()!.split(separator: " ") {
      permuation.append(Int(i)!)
    }
    
    print()
    
    var nums: [Int] = []
    for i in 1...sizeOfPermutation {
      nums.append(i)
    }
    
//    print("size: ", sizeOfPermutation)
//    print(nums)
    print("perm: ", permuation)
    
    var adjList = [[Int]](repeating: [], count: sizeOfPermutation + 1)
    
    for i in 0..<sizeOfPermutation {
      let u = nums[i]
      let v = permuation[i]
      
      adjList[u].append(v)
      //      adjList[v].append(u) // undirected graph
    }
    
    var visited = [Bool](repeating: false, count: sizeOfPermutation + 1)
    var count = 0
    for v in 1..<adjList.count {
      if !visited[v] {
        dfs(start: v, adjList: &adjList, visited: &visited)
        count += 1
      }
    }
    print("answer: ", count)
    print()
  }
  
  
  func dfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]) {
    visited[start] = true
    //      print(start)
    for v in adjList[start] {
      if !visited[v] {
        dfs(start: v, adjList: &adjList, visited: &visited)
      }
    }
  }
}


func repeatingSequence(n: Int, p: Int) {
  print(n, p)
  var res: [Int] = []
  
  func getDigitsSquared(from number: Int) -> [Int] {
      let numberString = String(number)
      var digits: [Int] = []
      for char in numberString {
          if let digit = Int(String(char)) {
              digits.append(digit*digit)
          }
      }
      return digits
  }
  
  func next(n: Int) -> Int {
    let split = getDigitsSquared(from: n)
    return sum(arr: split)
  }

  var m = n
  
  while !res.contains(m) {
    res.append(m)
    m = next(n: m)
  }
  
  let indexFound = res.firstIndex(of: m)!
  
  print(res[res.startIndex..<indexFound].count)
}
