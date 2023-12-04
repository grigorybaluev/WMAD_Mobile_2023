//
//  main.swift
//  Boyer-Moore
//
//  Created by MacBook on 19.07.2023.
//

import Foundation

extension String {
  func index(of pattern: String) -> Index? {
    // 1
    let patternLength = pattern.count
    guard patternLength > 0, patternLength <= count else { return nil }

    // 2
    let skipTable = pattern.skipTable
    let lastChar = pattern.last!

    // 3
    var i = index(startIndex, offsetBy: patternLength - 1)
    
    while i < endIndex {
      let c = self[i]

      // 2
      if c == lastChar {
        if let k = match(from: i, with: pattern) { return k }
        i = index(after: i)
      } else {
        // 3
        i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
      }
    }
    return nil
  }
  
  fileprivate var skipTable: [Character: Int] {
    var skipTable: [Character: Int] = [:]
    for (i, c) in enumerated() {
      skipTable[c] = count - i - 1
    }
    return skipTable
  }
  
  // 1
  fileprivate func match(from currentIndex: Index, with pattern: String) -> Index? {
    // 1
    if currentIndex < startIndex { return nil }
    if currentIndex >= endIndex { return nil }
    
    // 2
    if self[currentIndex] != pattern.last { return nil }

    // 3
    if pattern.count == 1 && self[currentIndex] == pattern.last { return currentIndex }
    return match(from: index(before: currentIndex), with: "\(pattern.dropLast())")
  }
}

var sourceString = "Hello World!"
var pattern = "World"
print(sourceString.distance(from: sourceString.startIndex, to: sourceString.index(of: pattern)!))
