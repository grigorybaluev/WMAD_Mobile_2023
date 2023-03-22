//
//  main.swift
//  Assignment5
//
//  Created by Derrick Park on 2023-03-10.
//

import Foundation


// How to read a file?
let filename = "sample.in"
var students: [Student] = []
if let contents = try? String(contentsOfFile: "/Users/macbook/Documents/study_WMAD/WMAD_Mobile_2023/OOP/06_Assignment_5_Student_Grades/Assignment_5_Student_Grades/Assignment_5_Student_Grades/\(filename)") {
    let contentsSeparated = contents.split(separator: "\n")
    let studentCount: Int = Int(contentsSeparated[0])!
    for i in Range(uncheckedBounds: (0, studentCount)) {
        let nameList = contentsSeparated[i*2+1].split(separator: ",").map({$0.trimmingCharacters(in: .whitespacesAndNewlines)})
        let firstName = nameList[1]
        let lastName = nameList[0]
        let subjectTitle = String(contentsSeparated[i*2+2].split(separator: " ")[0])
        let gradesList = contentsSeparated[i*2+2].split(separator: " ")[1...].map({Int($0)!})
        
        print(firstName)
        print(lastName)
        print(subjectTitle)
        print(gradesList)
        
        let newStudent = Student(firstName: firstName, lastName: lastName)
        newStudent.addClass(classTitle: subjectTitle, grades: gradesList)
        print(newStudent)
        
        print()
    }
//    print(contents)
}

//// How to write into a file?
//let outputFilename = "sample.out"
//let documentsToProjectDirectory = "study_WMAD/WMAD_Mobile_2023/OOP/06_Assignment_5_Student_Grades/Assignment_5_Student_Grades/Assignment_5_Student_Grades/"
//let outputString = "Hello, World!"
//if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//    var fileURL: URL
//    if #available(macOS 13.0, *) {
//        fileURL = dir.appending(path: outputFilename)
//    } else {
//        fileURL = dir.appendingPathComponent(documentsToProjectDirectory+outputFilename)
//    }
//    print(fileURL)
//    do {
//        try outputString.write(to: fileURL, atomically: false, encoding: .utf8)
//        print("Sucessfully wrote into \(fileURL.absoluteString)")
//    } catch {
//        print(error.localizedDescription)
//    }
//}

//let a = Student(firstName: "Gregory", lastName: "Baluev")
//print(a)
