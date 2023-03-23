import Foundation


// How to read a file?
let filename = "sample.in"
if let contents = try? String(contentsOfFile: "/Users/macbook/Documents/study_WMAD/WMAD_Mobile_2023/OOP/06_Assignment_5_Student_Grades/Assignment_5_Student_Grades/Assignment_5_Student_Grades/\(filename)") {
    let contentsSeparated = contents.split(separator: "\n")
    let studentCount: Int = Int(contentsSeparated[0])!
    for i in Range(uncheckedBounds: (0, studentCount)) {
        let nameList = contentsSeparated[i*2+1].split(separator: ",").map({$0.trimmingCharacters(in: .whitespacesAndNewlines)})
        let firstName = nameList[1]
        let lastName = nameList[0]
        let subjectTitle = String(contentsSeparated[i*2+2].split(separator: " ")[0])
        let gradesList = contentsSeparated[i*2+2].split(separator: " ")[1...].map({Int($0)!})
        
        var currentStudent = Student(firstName: firstName, lastName: lastName)
        
        if !currentStudent.studentExist() {
            currentStudent.addNewStudent()
        } else {
            currentStudent = getStudent(currentStudent.fullName)!
        }
        currentStudent.addSubject(subjectTitle: subjectTitle, grades: gradesList)
    }
}


//Student.studentList.map({print($0)})
//print()
var res = "Student Grade Summary\n---------------------\n\n"
for s in ["English", "History", "Math"] {
    res += getSubjectData(subjectTitle: s)
//    print(getSubjectData(subjectTitle: s), terminator: "")
}

res += "OVERALL GRADE DISTRIBUTION\n\n"
for (k, v) in SubjectBase.gradeDistribution.sorted(by: {$0 < $1}) {
    res += String(k)
    res += ": "
    res += String(v)
    res += "\n"
}
print(res)

// How to write into a file?
let outputFilename = "final.out"
let documentsToProjectDirectory = "study_WMAD/WMAD_Mobile_2023/OOP/06_Assignment_5_Student_Grades/Assignment_5_Student_Grades/Assignment_5_Student_Grades/"
let outputString = res
if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    var fileURL: URL
    if #available(macOS 13.0, *) {
        fileURL = dir.appending(path: outputFilename)
    } else {
        fileURL = dir.appendingPathComponent(documentsToProjectDirectory+outputFilename)
    }
    print(fileURL)
    do {
        try outputString.write(to: fileURL, atomically: false, encoding: .utf8)
        print("Sucessfully wrote into \(fileURL.absoluteString)")
    } catch {
        print(error.localizedDescription)
    }
}
