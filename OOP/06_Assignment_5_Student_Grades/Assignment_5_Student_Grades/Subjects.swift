import Foundation

class SubjectBase {
    public static var gradeDistribution: [String: [String]] = [:]
    private (set) var subjectTitle: String
    var grades: [Int]
    private (set) var finalExam: Int
    private (set) var finalAvg: Float
    private (set) var subjectStudents: [Student]
    
    init(subjectTitle: String, finalExam: Int) {
        self.subjectTitle = subjectTitle
        self.finalAvg = 0.0
        self.finalExam = finalExam
        self.subjectStudents = []
        self.grades = []
    }
    
    func printSubjectData() {
        var res = self.subjectTitle
        res += "\n\n"
        res += "Student                                   Final   Final   Letter\n"
        res += "Name                                      Exam    Avg     Grade\n"
        res += "----------------------------------------------------------------\n"
        print(res)
    }
    
    func calculateFinalAvg() -> Float {
        return 0.0
    }
}

extension SubjectBase: CustomStringConvertible {
    var description: String {
        var res = self.subjectTitle
        res += self.grades.description
        return res
    }
}

class SubjectEnglish: SubjectBase {
    private (set) var paperTermGrade: Int
    private (set) var midTermGrade: Int
    
    static let paperTermWeight = 0.25
    static let midTermWeight = 0.35
    static let finalExamWeight = 0.4
    
    init(grades: [Int]) {
        self.paperTermGrade = grades[0]
        self.midTermGrade = grades[1]
        super.init(subjectTitle: "English", finalExam: grades[2])
        self.grades = grades
    }
}

class SubjectHistory: SubjectBase {
    private (set) var attandanceGrade: Int
    private (set) var projectGrade: Int
    private (set) var midTermGrade: Int
    
    static let attandanceWeight = 0.25
    static let projectWeight = 0.35
    static let midTermWeight = 0.35
    static let finalExamWeight = 0.4
    init(grades: [Int]) {
        self.attandanceGrade = grades[0]
        self.projectGrade = grades[1]
        self.midTermGrade = grades[2]
        super.init(subjectTitle: "History", finalExam: grades[3])
        self.grades = grades
    }
}

class SubjectMath: SubjectBase {
    private (set) var quizAvg: Float
    private (set) var test1: Int
    private (set) var test2: Int
    
    static let quizAvgWeight = 0.25
    static let test1Weight = 0.35
    static let test2Weight = 0.35
    static let finalExamWeight = 0.4
    
    init(grades: [Int]) {
        self.quizAvg = Float(grades[0...4].reduce(0, {$0 + $1})) / 5
        self.test1 = grades[5]
        self.test2 = grades[6]
        super.init(subjectTitle: "Math", finalExam: grades[7])
        self.grades = grades
    }
    
    override func calculateFinalAvg() -> Float {
        return 0.0
    }
}

