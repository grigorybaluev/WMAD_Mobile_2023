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
    
    init(firstName: String = "", lastName: String = "") {
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Student: CustomStringConvertible {
    var description: String {
        return String(self.firstName + " " + self.lastName)
    }
    
    
}
