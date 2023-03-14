class Distance: CustomStringConvertible {
    var inches: Int
    var feet: Int
    var yards: Int
    var miles: Int
    
    init?(inches: Int) {
        if inches < 0 {
            return nil
        } else {
            self.miles = inches / 12 / 3 / 1760
            self.yards = inches / 12 / 3 % 1760
            self.feet = inches / 12 % 3
            self.inches = inches % 12
        }
    }
    
    init?(miles: Int = 0, yards: Int = 0, feet: Int = 0, inches: Int = 0) {
        for i in [miles, feet, yards, inches] {
            if i < 0 {
                return nil
            }
        }
        self.inches = inches
        self.feet = feet
        self.yards = yards
        self.miles = miles
    }
    
    var description: String {
        var m: String? { self.miles > 0 ? "\(self.miles)m" : nil }
        var y: String? { self.yards > 0 ? "\(self.yards)y" : nil }
        var f: String? { self.feet > 0 ? "\(self.feet)'" : nil }
        var i: String? { self.inches > 0 ? "\(self.inches)\"" : nil }
        var res: [String] = []
        for item in [m, y, f, i] {
            if let myString = item {
                res.append(myString)
            }
        }
        return String(res.joined(separator: " "))
    }
    
}
