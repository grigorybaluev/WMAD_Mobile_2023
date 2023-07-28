//
//  Recursion.swift
//  Swift_AGDS
//
//  Created by MacBook on 05.07.2023.
//

//import Foundation
//
//func power(base: Int, exp: Int) -> Int {
//  // base
//  if exp == 0 {
//    return 1
//  }
//  return base * power(base: base, exp:exp-1)
//}

//
//  Recursion.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2023-07-05.
//

import Foundation

func factorial(n: Int) -> Int {
  // base case
  if n == 0 || n == 1 {
    return 1
  }
  // recursive case
  return n * factorial(n: n - 1)
}

// 1. power(base, exponent) = base^exponent
// assume exponent >= 0
// ex) power(2, 5) = 32
func power(base: Int, exponent: Int) -> Int {
  // base
  if exponent <= 0 {
    return 1
  } else if exponent == 1 {
    return base
  } else {
    // recursive
    return base * power(base: base, exponent: exponent - 1)
  }
}

// 2. isPalindrome(word): checks if a word is palindrome
func isPalindrome(word: String) -> Bool {
  // base case
  if word.count <= 1 {
    return true
  }
  // recursive case
  if let first = word.first, let last = word.last, first == last {
    let s = word.index(after: word.startIndex)
    let l = word.index(before: word.endIndex)
    return isPalindrome(word: String(word[s..<l]))
  }
  return false
}


// 3. printBinary(n): prints binary form of given int
// - feel free to use a helper function
func printBinary(_ n: Int, _ padding: String = "") {
  print("\(padding)\(#function) n = \(n)")
  if n < 0 {
    print("-", terminator: "")
    printBinary(-n, padding + "  ")
    return
  }
  // base case
  if n < 2 {
    print(n, terminator: "")
    return
  }
  // recursive case
  printBinary(n / 2, padding + "  ")
  print(n % 2, terminator: "")
}


// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want
func reverseLines(_ line: Int) {
  let contents: String = try! String(contentsOfFile: "/Users/park/Desktop/Swift-AGDS/Swift-AGDS/Recursion/story.txt")
  
  let sentences = contents.split(separator: "\n")
  if line < sentences.count {
    reverseLines(line + 1)
    print(sentences[line])
  }
}


// 5. evaluate
// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
// - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
// - You can use a helper function. (Do not change the original function header)
// - Use Recursion
//
// Examples)
// evaluate("7")                 -> 7
// evaluate("(2+2)")             -> 4
// evaluate("(1+(2*4))")         -> 9
// evaluate("((1+3)+((1+2)*5))") -> 19
func evaluate(_ expr: String) -> Int {
  var i = 0
  return evaluateHelper(expr, &i)
}

// expr[i] -> string at index i
// expr[i, j] -> string from index i to j  [i..<j]
func evaluateHelper(_ expr: String, _ i: inout Int) -> Int {
  let parenthesis = "()"
  let operands = "+-*/"
  var res = 0
  if Character(expr[i]).isNumber, expr.count == 1 {
    return Int(expr[i])!
  }
  if Character(expr[i]).isNumber, expr.count != 1 {
    if Character(expr[i+1]) == "+" {
      print("here")
      res += evaluateHelper(expr[i], &i)
      res += evaluateHelper(expr[i+2], &i)
      i += 1
      return res
    }
    if Character(expr[i+1]) == "-" {
      res += evaluateHelper(expr[i], &i)
      res -= evaluateHelper(expr[i+2], &i)
      i += 1
      return res
    }
    if Character(expr[i+1]) == "*" {
      res += evaluateHelper(expr[i], &i)
      res *= evaluateHelper(expr[i+2], &i)
      i += 1
      return res
    }
    if Character(expr[i+1]) == "/" {
      res += evaluateHelper(expr[i], &i)
      res /= evaluateHelper(expr[i+2], &i)
      i += 1
      return res
    }
  }
  if expr[i] == "(" {
    res += evaluateHelper(expr[i+1,expr.count-1], &i)
    i += expr.count - 2
    return res
  }
  return 0
}
