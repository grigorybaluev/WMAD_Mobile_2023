//
//  main.swift
//  Mini-Project1
//
//  Created by MacBook on 10.07.2023.
//

import Foundation

let fileManager: FileManager = FileManager.default
//let currentDirectoryPath: String = fileManager.currentDirectoryPath

func isDirectory(path: String) -> Bool {
  var isDirectory: ObjCBool = false
  if fileManager.fileExists(atPath: path, isDirectory: &isDirectory) {
    if isDirectory.boolValue {
      return true
    }
  }
  return false
}

//var count = 0


//func printContent(_ currentPath: String) {
func printContent() {
  let currentPath: String = fileManager.currentDirectoryPath
  print(currentPath.split(separator: "/").last!)
  var i = 0
  var fileCount = 0
  var folderCount = 0
  printContentHelper(currentPath, &i, &fileCount, &folderCount)
  print("")
  print("folders: \(folderCount)")
  print("files: \(fileCount)")
}

func printContentHelper(_ currentPath: String, _ count: inout Int, _ fileCount: inout Int, _ folderCount: inout Int) {
  
  if isDirectory(path: currentPath) {
    folderCount += 1
    
    print(String(repeating: "│  ", count: count), terminator: "")
    
    if let contents: [String] = try? fileManager.contentsOfDirectory(atPath: currentPath) {
      count += 1
      for (index, name) in contents.sorted().enumerated() {
        if index == contents.count - 1 {
          let currentPath = currentPath + "/" + name
          print("└─", name)
          printContentHelper(currentPath, &count, &fileCount, &folderCount)
          count -= 1
//          print()
          return
        } else {
          let currentPath = currentPath + "/" + name
          print("├─", name)
          printContentHelper(currentPath, &count, &fileCount, &folderCount)
        }
      }
    }
  } else {
    print(String(repeating: "│  ", count: count-1), terminator: "")
    fileCount += 1
  }
}

//printContent(currentDirectoryPath)
//printContent()
