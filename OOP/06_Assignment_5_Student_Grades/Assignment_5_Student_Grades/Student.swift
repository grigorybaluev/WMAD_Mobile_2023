import Foundation

class Student {
    static var studentNamesSet: Set<String> = []
    static var studentList: [Student] = []
//    private (set) var studentUUID: UUID
    private (set) var firstName: String
    private (set) var lastName: String
    private (set) var fullName: String
//    private (set) var studentSubjects: [String: [Int]]
    private (set) var studentSubjects: [(SubjectBase, [Int])]
    
    
    init(firstName: String = "", lastName: String = "") {
//        self.studentUUID = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = firstName + " " + lastName
        self.studentSubjects = []
    }
    
    func addSubject(subjectTitle: String, grades: [Int]) -> Void {
        let newSubject = SubjectBase(subjectTitle: subjectTitle, finalExam: 90)
        self.studentSubjects.append((newSubject, grades))
    }
    
    func studentExist() -> Bool {
        return Student.studentNamesSet.contains(self.fullName)
    }
    
    func addNewStudent() {
        Student.studentList.append(self)
        Student.studentNamesSet.insert(self.fullName)
    }
}

extension Student: CustomStringConvertible {
    var description: String {
        return [self.firstName, self.lastName, self.studentSubjects.description].joined(separator: " ")
    }
}

func getStudent(_ fullName: String) -> Student? {
    if let studentIndex = Student.studentList.firstIndex(where: {$0.fullName == fullName}) {
        return Student.studentList[studentIndex]
    } else {
        return nil
    }
}
