//
//  findDuplicate.swift
//  FinalExamBaluev
//
//  Created by MacBook on 08.09.2023.
//

import Foundation

func findDuplicate(_ arr: [Int]) -> Int? {
  var d: [Int: Bool] = [:]
  for i in arr {
    if !(d[i] ?? false) {
      d[i] = true
    } else {
      return i
    }
  }
  return nil
}
