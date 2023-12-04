//
//  happyOrSad.swift
//  FinalExamBaluev
//
//  Created by MacBook on 08.09.2023.
//

import Foundation

func happyOrSad(_ text: String) -> String {
  var count = 0
  
  if text.count < 3 {
    return "none"
  }
  
  for i in 0..<text.count - 3 {
    let seg = Array(text)[i..<i+3]
    if seg == [":", "-", ")"] {
      count += 1
    } else if seg == [":", "-", "("]{
      count -= 1
    }
  }
  
  if count < 0 {
    return "sad"
  } else if count == 0 {
    return "none"
  } else {
    return "happy"
  }
}
