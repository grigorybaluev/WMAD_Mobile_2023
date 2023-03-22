//
//  Class.swift
//  Assignment_5_Student_Grades
//
//  Created by MacBook on 21.03.2023.
//

import Foundation

class SubjectBase {
    public static var gradeDistribution: [String: [String]] = [:]
    private (set) var subjectTitle: String
    
    init(subjectTitle: String) {
        self.subjectTitle = subjectTitle
    }

}

extension SubjectBase: CustomStringConvertible {
    var description: String {
        var res = self.subjectTitle
        res += "\n\n"
        res += "Student                                   Final   Final   Letter\n"
        res += "Name                                      Exam    Avg     Grade\n"
        res += "----------------------------------------------------------------\n"
        return res
    }
    
    
}



//enum ClassType: String {
//    case english = "English"
//    case history = "History"
//    case math = "Math"
//
//}
