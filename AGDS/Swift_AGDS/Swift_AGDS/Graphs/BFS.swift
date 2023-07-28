//
//  BFS.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2023-07-25.
//

import Foundation

func adjacencyListBFS() {
  let firstLine = readLine()!.split(separator: " ")
  // # of vertices
  let n = Int(firstLine[0])!
  // # of edges
  let m = Int(firstLine[1])!
  
  // adjacency list
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    
    adjList[u].append(v)
    adjList[v].append(u) // undirected graph
  }
  
  func bfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]) {
    let q = Queue<Int>()
    q.enqueue(item: start)
    visited[start] = true
    while !q.isEmpty() {
      let u = q.dequeue()!
      print(u)
      for v in adjList[u] {
        if !visited[v] {
          q.enqueue(item: v)
          visited[v] = true
        }
      }
    }
  }
  
  var visited = [Bool](repeating: false, count: n + 1)
  bfs(start: 1, adjList: &adjList, visited: &visited)
}

