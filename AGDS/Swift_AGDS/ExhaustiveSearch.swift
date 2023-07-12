//
//  ExhaustiveSearch.swift
//  Swift_AGDS
//
//  Created by MacBook on 07.07.2023.
//

import Foundation

//func myPrintBinary(n: Int) -> String {
//  //base
//  if n == 0 {
//    print()
//  }
//
//  return myPrintBinary(n: n-1)
//
//}

func printDecimal(n: Int) {
  printDecimalHelper(n: n)
}

func printDecimalHelper(n: Int, soFar: String = "") {
  if n == 0 {
    print(soFar)
  } else {
    for i in 0...9 {
      let c = i
      printDecimalHelper(n: n-1, soFar: soFar + "\(c)")
    }
  }
}

func permutations(str: String, soFar: String = "") {
  if str.count == 0 {
    print(soFar)
  } else {
    for i in 0..<str.count {
      permutations(str: str[0,i] + str[i+1,str.count], soFar: soFar + str[i])
    }
  }
}
