import Foundation

func findRealSushi() {
  var (restCount, realRestCount) = (0, 0)
  let input = readLine()!.split(separator: " ").map( { Int($0)} )
  var edges = [(Int, Int)]()
  if let rc = input[0], let rrc = input[1] {
    (restCount, realRestCount) = (rc, rrc)
  }
  
  let realRestIndex = readLine()!.split(separator: " ").map( { Int($0)!} )
  
  for _ in 0..<restCount-1 {
    let edge = readLine()!.split(separator: " ").map( {Int($0)!} )
    if edge.count == 2 {
      edges.append((edge[0], edge[1]))
    }
  }
  
  func readInputSushi(edges: [(Int, Int)]) -> (Int, [[(Int, Int)]]) {
    let V = edges.count
    var adjList = Array(repeating: [(Int, Int)](), count: V + 1)
    
    for i in 1...V {
      let line = edges[i-1]
      adjList[line.0].append((line.1, 1))
      adjList[line.1].append((line.0, 1))
    }
    return (V, adjList)
  }
  
  func findFarthestNodeSushi(_ node: Int, _ distance: Int, _ adjList: [[(Int, Int)]], _ visited: inout [Bool], _ path: inout [Int]) -> (Int, Int) {
    visited[node] = true
    var farthestNode = node
    var maxDistance = distance
    
    for (v, d) in adjList[node] {
      if !visited[v] {
        let (farNode, farDist) = findFarthestNodeSushi(v, distance + d, adjList, &visited, &path)
        if farDist > maxDistance {
          farthestNode = farNode
          maxDistance = farDist
          path.append(farNode)
        }
      }
    }
    
    return (farthestNode, maxDistance)
  }
  
  func removeLeavesNotRealSushi(from graph: inout [[(Int, Int)]], v: Int, sushi: Set<Int>, visited: inout [Bool]) {
    visited[v] = true
    for (u, _) in graph[v] {
      if !visited[u] {
        removeLeavesNotRealSushi(from: &graph, v: u, sushi: sushi, visited: &visited)
      }
    }
    
    if graph[v].count == 1 && !sushi.contains(v) {
      graph[v] = []
      var edgesToRemove = [(Int, Int)]()
      for (i, u) in graph.enumerated() {
        for (j, uEdge) in u.enumerated() {
          if uEdge.0 == v {
            edgesToRemove.append((i, j))
          }
        }
      }
      
      for edge in edgesToRemove {
        graph[edge.0].remove(at: edge.1)
      }
    }
  }
  
  var (V, adjList) = readInputSushi(edges: edges)
  var visited = [Bool](repeating: false, count: V+1)
  var visited2 = [Bool](repeating: false, count: V+1)
  var path = [Int]()
  
  removeLeavesNotRealSushi(from: &adjList, v: 0, sushi: Set<Int>(realRestIndex), visited: &visited)
  
  let (farthestNode1, _) = findFarthestNodeSushi(1, 0, adjList, &visited2, &path)
  let (_, diameter) = findFarthestNodeSushi(farthestNode1, 0, adjList, &visited2, &path)
  
  var countFinEdges = 0
  for v in adjList {
    for _ in v {
      countFinEdges += 1
    }
  }

  let res = countFinEdges - diameter
  
  print()
  print(res)
}

