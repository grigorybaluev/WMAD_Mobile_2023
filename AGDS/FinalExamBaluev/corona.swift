//
//  corona.swift
//  FinalExamBaluev
//
//  Created by MacBook on 08.09.2023.
//

import Foundation

func corona(_ p: Int, _ n: Int, _ r: Int) -> Int {
  var countSick = 0
  var countInfect = n
  var day = 0
  
  while countSick <= p {
    countSick += countInfect
    countInfect = countInfect * r
    day += 1
  }
  
  return day-1
}
