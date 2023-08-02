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
