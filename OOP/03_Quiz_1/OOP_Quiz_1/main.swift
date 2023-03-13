import Foundation

var r1 = Rectangle(x: 0, y: 3, width: 12, height: 3)
var r2 = Rectangle(x: -3, y: 3, width: -3, height: 5)
var r3 = Rectangle(x: -5, y: -7, width: 9, height: 6)
print(r1)
r1.draw()
print(r2)
//r2.width = -3
r2.draw()
print(r3)
r3.draw()

print("=========")

r2.testObserver()
print(r2.width)
r2.draw()

print("=========")

print(Rectangle.rectCount)
