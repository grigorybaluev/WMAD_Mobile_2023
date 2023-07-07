//
//  Big_o_practice.swift
//  Swift_AGDS
//
//  Created by MacBook on 05.07.2023.
//

import Foundation

// 1.
// Time Function f(n) = 3
// Space Function s(n) = 3

// Time Complexity: O(1) - constant
// Space Complexity: O(1) - constant
func swap(a: inout Int, b: inout Int) {
  let temp = a
  a = b
  b = temp
}


// 2.
// Time Function f(n) = 2n + 3
// Space Function s(n) = n + 3

// Time Complexity: O(n) - linear
// Space Complexity: O(n) - linear
func sum(arr: [Int]) -> Int {
  let n = arr.count
  var total = 0
  for i in 0..<n {
    total += arr[i]
  }
  
  return total
}


// 3.
// Time Function f(n) = 2n^2 + 2n + 4
// Space Function s(n) = 3n^2 + 3

// Time Complexity = O(n^2)
// Space Complexity = O(n^2)
// Note that a and b is n(rows) x n(cols) array(matrix).
func add(a: [[Int]], b: [[Int]]) -> [[Int]] {
  let n = a.count
  var c = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  
  for i in 0..<n {
    for j in 0..<n {
      c[i][j] = a[i][j] + b[i][j]
    }
  }
  return c
}


// 4.
// Time Function f(n) = 2n^3 + 3n^2 + 2n + 1
// Space Function s(n) = 3n^2 + 4

// Time Complexity = O(n^3)
// Space Complexity = O(n^2)
// Note that a and b is n(rows) x n(cols) array(matrix).
func multiply(a: [[Int]], b: [[Int]]) -> [[Int]] {
  let n = a.count
  var c = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  
  for i in 0..<n {
    for j in 0..<n {
      c[i][j] = 0
      for k in 0..<n {
        c[i][j] = a[i][k] * b[k][j]
      }
    }
  }
  return c
}

// Big-O Exercises
let n: Int = 0 // assume n is the size of the input
// 1.

// Time Complexity = O(n)
// Space Complexity = O(1)
func a() {
  for i in stride(from: 0, to: n, by: 2) {
    // some statements
  }
}

// 2.

// Time Complexity = O(n^2)
// Space Complexity = O(n)
func b() {
  for i in 0..<n {
    for j in 0..<n {
      // some statements
    }
  }
}


// 3.

// Time Complexity = O(n^2)
// Space Complexity = O(1)
func c() {
  for i in 0..<n {
    for j in 0..<i {
      // some statements
    }
  }
}


// 4.

// Time Complexity = O(n)
// Space Complexity = O(n)
func d() {
  var p = 0
  var i = 1
  while p <= n {
    p = p + i
    i += 1
  }
}


// 5.

// Time Complexity = O(1)
// Space Complexity = O(1)
func e() {
  var i = 1
  while i < n {
    // some statement
    i *= 2
  }
}
  

// 6.

// Time Complexity = O(1)
// Space Complexity = O(1)
func f() {
  var i = n
  while i >= 1 {
    // some statements
    i = i / 2
  }
}


// 7.

// Time Complexity = O(1)
// Space Complexity = O(1)
func g() {
  var i = 0
  while i * i < n {
    // some statements
    i += 1
  }
}


// 8.

// Time Complexity = O(n)
// Space Complexity = O(n)
func h() {
  for i in 0..<n {
    // some statements
  }
  for j in 0..<n {
    // some statements
  }
}


// 9.

// Time Complexity = O(n)
// Space Complexity = O(n)
func i() {
  var p = 0
  var i = 1
  while i < n {
    p += 1
    i *= 2
  }
  var j = 1
  while j < p {
    // some statements
    j *= 2
  }
}


// 10.

// Time Complexity = O(n^2)
// Space Complexity = O(n)
func j() {
  for i in 0..<n {
    var j = 1
    while j < n {
      // some statements
      j *= 2
    }
  }
}


// Names
//O(1) - Contant
//O(lg N) - Logarithmic
//O(N) - Linear
//O(N^2) - Quadratic // polynomial time
//O(N^3) - Cubic // polynomial time
//O(2^n), O(3^n), ..., O(n^n) - Exponential
//
// The Fastest to Slowest
//
//1 < lg N < sqrt(N) < N < Nlg N < N^2 < N^3 < ... < 2^n < 3^n < ... < n^n
