//
//  TreeTraversal.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2023-07-31.
//

import Foundation


func preorder(_ node: Int, _ tree: inout [[Int]]) {
  // visit
  print(node)
  // left
  preorder(tree[node][0], &tree)
  // right
  preorder(tree[node][1], &tree)
}

func inorder(_ node: Int, _ tree: inout [[Int]]) {
  // left
  inorder(tree[node][0], &tree)
  // visit
  print(node)
  // right
  inorder(tree[node][1], &tree)
}

func postorder(_ node: Int, _ tree: inout [[Int]]) {
  // left
  postorder(tree[node][0], &tree)
  // right
  postorder(tree[node][1], &tree)
  // visit
  print(node)
}

func treeTraversal() {
  let n: Int = Int(readLine()!)!
  var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
  for _ in 0..<n {
    let data = readLine()!.split(separator: " ")
    for (index, node) in data.enumerated() {
      if node == "." {
        continue
      }
      if index == 0 {
        
      }
    }
  }
}


//Definition for a binary tree node.
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

//Definition for a n-ary tree node.
public class Node {
  public var val: Int
  public var children: [Node]
  public init(_ val: Int) {
    self.val = val
    self.children = []
  }
}

//func convertToNode(root: inout [Int?]) -> Node {
//  let node = Node(root[0]!)
//  if let indexOfNil = root.firstIndex(of: nil) {
//    print(indexOfNil)
//    print(root[2..<indexOfNil])
//    node.children = root[1..<indexOfNil].map( { Node($0!) } )
//    print(node.children)
//  } else {
//    node.children = root[1...root.count].map( { Node($0!) } )
////    print(node.children)
//  }
//
//  return node
////  node.children = root[1..<root.firstIndex(of: nil)]
//
//}

class Solution {
  //  preorder for n-ary tree
  func preorder(_ root: Node?) -> [Int] {
    var result = [Int]()
    if let node = root {
      result.append(node.val)
      for child in node.children {
        let traverse = preorder(child)
        result.append(contentsOf: traverse)
      }
    }
    return result
  }
  
  // postorder for n-ary tree
  func postorder(_ root: Node?) -> [Int] {
    var result = [Int]()
    if let node = root {
      for child in node.children {
        let traverse = postorder(child)
        result.append(contentsOf: traverse)
      }
      result.append(node.val)
    }
    return result
  }
  
  //  preorder for binary tree
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    if let node = root {
      res.append(node.val)
      res.append(contentsOf: preorderTraversal(node.left))
      res.append(contentsOf: preorderTraversal(node.right))
    }
    return res
  }
  
  // inorder for binary
  func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    if let node = root {
      res.append(contentsOf: inorderTraversal(node.left))
      res.append(node.val)
      res.append(contentsOf: inorderTraversal(node.right))
    }
    return res
  }
  
  // postorder for binary tree
  func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    if let node = root {
      res.append(contentsOf: postorderTraversal(node.left))
      res.append(contentsOf: postorderTraversal(node.right))
      res.append(node.val)
    }
    return res
  }
}


func whosMyParent() {
  var edges = [[Int]]()
  
  for _ in 0..<Int(readLine()!)!-1 {
    edges.append(readLine()!.split(separator: " ").map( {Int($0)!} ))
  }
  
  var childrenDict: [Int: [Int]] = [1: []]
  var root = 1
  var myEdges = edges
  let parentsToCheck = Queue<Int>()
  
  while myEdges.count > 0 {
    for edge in myEdges {
      
      if edge.contains(root) {
        for node in edge {
          if node != root {
            if childrenDict[root] == nil {
              childrenDict[root] = []
            }
            childrenDict[root]?.append(node)
            parentsToCheck.enqueue(item: node)
            myEdges.remove(at: myEdges.firstIndex(of: edge)!)
          }
        }
      }
    }
    root = parentsToCheck.dequeue()!
  }
  
  var parentArray = [Int](repeating: -1, count: edges.count+2)
  for (k, v) in childrenDict {
    for n in v {
      parentArray[n] = k
    }
  }
  
  parentArray.removeFirst(2)
  print(parentArray)
}


func findFarthestNode(_ node: Int, _ distance: Int, _ adjList: [[(Int, Int)]], _ visited: inout [Bool]) -> (Int, Int) {
  visited[node] = true
  var farthestNode = node
  var maxDistance = distance
  
  for (v, d) in adjList[node] {
    if !visited[v] {
      let (farNode, farDist) = findFarthestNode(v, distance + d, adjList, &visited)
      if farDist > maxDistance {
        farthestNode = farNode
        maxDistance = farDist
      }
    }
  }
  
  return (farthestNode, maxDistance)
}

func readInput() -> (Int, [[(Int, Int)]]) {
  let V = Int(readLine()!)!
  var adjList = Array(repeating: [(Int, Int)](), count: V + 1)
  
  for i in 1...V {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    var j = 1
    while line[j] != -1 {
      adjList[i].append((line[j], line[j + 1]))
      j += 2
    }
  }
  return (V, adjList)
}

func findDiameter() {
  let (V, adjList) = readInput()
  var visited = [Bool](repeating: false, count: V + 1)
  
  // First DFS to find the farthest node from any node (start with node 1)
  let (farthestNode1, _) = findFarthestNode(1, 0, adjList, &visited)
  
  // Reset visited array for the second DFS
  visited = [Bool](repeating: false, count: V + 1)
  
  // Second DFS to find the actual diameter starting from the farthest node
  let (_, diameter) = findFarthestNode(farthestNode1, 0, adjList, &visited)
  
//  return diameter
  print(diameter)
}



