//
//  main.swift
//  Assignment5
//
//  Created by Derrick Park on 2023-03-10.
//

import Foundation


// How to read a file?
let filename = "sample.in"
if let contents = try? String(contentsOfFile: "/Users/park/Desktop/Assignment5/Assignment5/\(filename)") {
  print(contents)
}

// How to write into a file?
let outputFilename = "sample.out"
let outputString = "Hello, World!"
if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
  
  let fileURL = dir.appending(path: outputFilename)
  do {
    try outputString.write(to: fileURL, atomically: false, encoding: .utf8)
    print("Sucessfully wrote into \(fileURL.absoluteString)")
  } catch {
    print(error.localizedDescription)
  }
}
