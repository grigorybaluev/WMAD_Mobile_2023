//
//  Rectangle.swift
//  OOP_Quiz_1
//
//  Created by MacBook on 10.03.2023.
//

import Foundation

class Rectangle: CustomStringConvertible, Comparable {
    private(set) var x: Int
    private(set) var y: Int
    private(set) var validWidth: Bool = true
    private(set) var validHeight: Bool = true
    private(set) var width: Int {
        willSet {
            if newValue < 0 {
                validWidth = false
                return
            }
        }
        didSet {
            if !validWidth {
                width = 0
            }
        }
    }
    private(set) var height: Int {
        willSet {
            if newValue < 0 {
                validHeight = false
                return
            }
        }
        didSet {
            if !validHeight {
                width = 0
            }
        }
    }
    private(set) static var rectCount: Int = 0
    
    init(x: Int, y: Int, width: Int, height: Int) {
        Rectangle.rectCount += 1
        
        if x < 0 {
            self.x = 0
        } else {
            self.x = x
        }
        if y < 0 {
            self.y = 0
        } else {
            self.y = y
        }
        if width < 0 {
            self.width = 0
        } else {
            self.width = width
        }
        if height < 0 {
            self.height = 0
        } else {
            self.height = height
        }
    }
    
    func getArea() -> Int {
        return self.width * self.height
    }
    
    var description: String {
        let dx = self.x + self.width
        let dy = self.y + self.height
        return "This rectangle has a lower left corner at (\(self.x), \(self.y)) and upper right corner at (\(dx), \(dy))"
    }
    static func == (lhs: Rectangle, rhs: Rectangle) -> Bool { lhs.width == rhs.width && lhs.height == rhs.height && lhs.x == rhs.x && lhs.y == rhs.y}
    static func < (lhs: Rectangle, rhs: Rectangle) -> Bool { lhs.getArea() < rhs.getArea() }
    
    func draw() {
        if self.height <= 0 || self.width <= 0 {
            print()
            return
        }
        for _ in 0..<self.height {
            for _ in 0..<self.width {
                print("*", terminator: "")
            }
            print()
        }
    }
    
    func testObserver() {
        self.width = -1
        self.height = -5
    }
}
