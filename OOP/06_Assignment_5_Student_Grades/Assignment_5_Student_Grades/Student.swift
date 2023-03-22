//
//  Student.swift
//  Assignment_5_Student_Grades
//
//  Created by MacBook on 21.03.2023.
//

import Foundation

class Student {
    private (set) var firstName: String
    private (set) var lastName: String
    private (set) var studentClasses: [String: [Int]]
    
    init(firstName: String = "", lastName: String = "") {
        self.firstName = firstName
        self.lastName = lastName
        self.studentClasses = [:]
    }
    
    func addClass(classTitle: String, grades: [Int]) -> Void {
        self.studentClasses[classTitle] = grades
    }
}

extension Student: CustomStringConvertible {
    var description: String {
        return [self.firstName, self.lastName, self.studentClasses.description].joined(separator: " ")
    }
    
    
}
