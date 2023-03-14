class Distance: CustomStringConvertible, Comparable {
    var inches: Int
    var feet: Int
    var yards: Int
    var miles: Int
    
    func updateUnits() {
        self.miles = self.inches / 12 / 3 / 1760
        self.yards = self.inches / 12 / 3 % 1760
        self.feet = self.inches / 12 % 3
        self.inches = self.inches % 12
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
    
    init?(inches: Int) {
        if inches < 0 {
            return nil
        } else {
            self.miles = 0
            self.yards = 0
            self.feet = 0
            self.inches = inches
            self.updateUnits()
        }
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
    
    static func + (lhs: Distance, rhs: Distance) -> Distance {
        let res = Distance()!
        res.inches = lhs.inches + rhs.inches +
                    (lhs.feet + rhs.feet) * 12 +
                    (lhs.yards + rhs.yards) * 12 * 3 +
                    (lhs.miles + rhs.miles) * 12 * 3 * 1760
        res.updateUnits()
        return res
    }
    
    static func += (lhs: Distance, rhs: Int) -> Void {
        lhs.inches = lhs.inches +
                     lhs.feet * 12 +
                     lhs.yards * 12 * 3 +
                     lhs.miles * 12 * 3 * 1760 + rhs
        lhs.updateUnits()
    }
    
    static func - (lhs: Distance, rhs: Distance) -> Distance? {
        let res = Distance()!
        res.inches = lhs.inches - rhs.inches +
                    (lhs.feet - rhs.feet) * 12 +
                    (lhs.yards - rhs.yards) * 12 * 3 +
                    (lhs.miles - rhs.miles) * 12 * 3 * 1760
        res.updateUnits()
        return res
    }
    
    static func * (lhs: Distance, rhs: Int) -> Distance {
        let res = Distance()!
        if rhs < 1 {
            return res
        } else {
            res.inches = (lhs.inches +
                          lhs.feet * 12 +
                          lhs.yards * 12 * 3 +
                          lhs.miles * 12 * 3 * 1760) * rhs
            res.updateUnits()
            return res
        }
    }
    
    static func == (lhs: Distance, rhs: Distance) -> Bool {
        return lhs.miles == rhs.miles && lhs.yards == rhs.yards && lhs.feet == rhs.feet && lhs.inches == rhs.inches
    }
    
    static func != (lhs: Distance, rhs: Distance) -> Bool {
        return !(lhs.miles == rhs.miles && lhs.yards == rhs.yards && lhs.feet == rhs.feet && lhs.inches == rhs.inches)
    }
    
    static func < (lhs: Distance, rhs: Distance) -> Bool {
        if lhs.miles == rhs.miles {
            if lhs.yards == rhs.yards {
                if lhs.feet == rhs.feet {
                    return lhs.inches < rhs.inches
                }
                return lhs.feet < rhs.feet
            }
            return lhs.yards < rhs.yards
        }
        return lhs.miles < rhs.miles
    }
    
    static func > (lhs: Distance, rhs: Distance) -> Bool {
        return !(lhs < rhs || lhs == rhs)
    }
}
