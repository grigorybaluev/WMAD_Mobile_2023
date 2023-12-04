//
//  palindromeLength.swift
//  FinalExamBaluev
//
//  Created by MacBook on 08.09.2023.
//

import Foundation

func palindromeLength(_ word: String) -> Int {
  let n = word.count
  if n <= 1 {
    return n
  }
  
  let characters = Array(word)
  var dp = Array(repeating: Array(repeating: false, count: n), count: n)
  var maxLength = 1
  var start = 0
  
  for i in 0..<n {
    dp[i][i] = true
  }
  
  for i in 0..<n-1 {
    if characters[i] == characters[i+1] {
      dp[i][i+1] = true
      maxLength = 2
      start = i
    }
  }
  
  for len in 3...n {
    for i in 0..<n-len+1 {
      let j = i + len - 1
      
      if characters[i] == characters[j] && dp[i+1][j-1] {
        dp[i][j] = true
        
        if len > maxLength {
          maxLength = len
          start = i
        }
      }
    }
  }
  
  let startIndex = word.index(word.startIndex, offsetBy: start)
  let endIndex = word.index(startIndex, offsetBy: maxLength - 1)
  return String(word[startIndex...endIndex]).count
}
