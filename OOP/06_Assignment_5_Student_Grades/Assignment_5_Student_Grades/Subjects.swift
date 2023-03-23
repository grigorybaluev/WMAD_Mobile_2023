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
    
    func updFinalAvg() {
        self.finalAvg = calculateFinalAvg()
    }
}

extension SubjectBase: CustomStringConvertible {
    var description: String {
        var res = self.subjectTitle
        res += self.grades.description
        res += String(Double(Int(self.finalAvg*100))/100)
        return res
    }
}

class SubjectEnglish: SubjectBase {
    private (set) var paperTermGrade: Int
    private (set) var midTermGrade: Int
    
    static let paperTermWeight: Float = 0.25
    static let midTermWeight: Float = 0.35
    static let finalExamWeight: Float = 0.4
    
    init(grades: [Int]) {
        self.paperTermGrade = grades[0]
        self.midTermGrade = grades[1]
        super.init(subjectTitle: "English", finalExam: grades[2])
        self.grades = grades
    }
    
    override func calculateFinalAvg() -> Float {
        var res: Float = 0.0
        res += Float(paperTermGrade) * SubjectEnglish.paperTermWeight
        res += Float(midTermGrade) * SubjectEnglish.midTermWeight
        res += Float(self.finalExam) * SubjectEnglish.finalExamWeight
        return Float(Int(res*100))/100
    }
}

class SubjectHistory: SubjectBase {
    private (set) var attandanceGrade: Int
    private (set) var projectGrade: Int
    private (set) var midTermGrade: Int
    
    static let attandanceWeight: Float = 0.1
    static let projectWeight: Float = 0.3
    static let midTermWeight: Float = 0.3
    static let finalExamWeight: Float = 0.3
    init(grades: [Int]) {
        self.attandanceGrade = grades[0]
        self.projectGrade = grades[1]
        self.midTermGrade = grades[2]
        super.init(subjectTitle: "History", finalExam: grades[3])
        self.grades = grades
    }
    
    override func calculateFinalAvg() -> Float {
        var res: Float = 0.0
        res += Float(attandanceGrade) * SubjectHistory.attandanceWeight
        res += Float(projectGrade) * SubjectHistory.projectWeight
        res += Float(midTermGrade) * SubjectHistory.midTermWeight
        res += Float(self.finalExam) * SubjectHistory.finalExamWeight
        return Float(Int(res*100))/100
    }
}

class SubjectMath: SubjectBase {
    private (set) var quizAvg: Float
    private (set) var test1: Int
    private (set) var test2: Int
    
    static let quizAvgWeight: Float = 0.15
    static let test1Weight: Float = 0.25
    static let test2Weight: Float = 0.25
    static let finalExamWeight: Float = 0.35
    
    init(grades: [Int]) {
        self.quizAvg = Float(grades[0...4].reduce(0, {$0 + $1})) / 5
        self.test1 = grades[5]
        self.test2 = grades[6]
        super.init(subjectTitle: "Math", finalExam: grades[7])
        self.grades = grades
    }
    
    override func calculateFinalAvg() -> Float {
        var res: Float = 0.0
        res += Float(quizAvg) * SubjectMath.quizAvgWeight
        res += Float(test1) * SubjectMath.test1Weight
        res += Float(test2) * SubjectMath.test2Weight
        res += Float(self.finalExam) * SubjectMath.finalExamWeight
        return Float(Int(res*100))/100
    }
}

