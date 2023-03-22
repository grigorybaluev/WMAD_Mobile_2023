import Foundation

class SubjectBase {
    public static var gradeDistribution: [String: [String]] = [:]
    private (set) var subjectTitle: String
//    private (set) var finalExam: Int
//    private (set) var finalAvg: Float
    private (set) var subjectStudents: [Student]
    
    init(subjectTitle: String, finalExam: Int) {
        self.subjectTitle = subjectTitle
//        self.finalAvg = 0.0
//        self.finalExam = finalExam
        self.subjectStudents = []
    }
    
    func getFinalAvg() -> Float {
        return 0.0
    }
    
    func printSubjectData() {
        var res = self.subjectTitle
        res += "\n\n"
        res += "Student                                   Final   Final   Letter\n"
        res += "Name                                      Exam    Avg     Grade\n"
        res += "----------------------------------------------------------------\n"
        print(res)
    }
}

extension SubjectBase: CustomStringConvertible {
    var description: String {
        var res = self.subjectTitle
//        res += "\n\n"
//        res += "Student                                   Final   Final   Letter\n"
//        res += "Name                                      Exam    Avg     Grade\n"
//        res += "----------------------------------------------------------------\n"
        return res
    }
}


