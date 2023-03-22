import Foundation

class Student {
    static var studentNamesSet: Set<String> = []
    static var studentList: [Student] = []
//    private (set) var studentUUID: UUID
    private (set) var firstName: String
    private (set) var lastName: String
    private (set) var fullName: String
    private (set) var studentClasses: [String: [Int]]
    
    
    init(firstName: String = "", lastName: String = "") {
//        self.studentUUID = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = firstName + " " + lastName
        self.studentClasses = [:]
    }
    
    func addClass(classTitle: String, grades: [Int]) -> Void {
        self.studentClasses[classTitle] = grades
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
        return [self.firstName, self.lastName, self.studentClasses.description].joined(separator: " ")
    }
    
    
}

func getStudent(_ fullName: String) -> Student? {
    if let studentIndex = Student.studentList.firstIndex(where: {$0.fullName == fullName}) {
        return Student.studentList[studentIndex]
    } else {
        return nil
    }
        
}
