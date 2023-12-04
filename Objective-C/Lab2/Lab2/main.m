#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // Initialize two boxes
    Box *box1 = [[Box alloc] initWithHeight:5.0 width:3.0 length:2.0];
    Box *box2 = [[Box alloc] initWithHeight:4.0 width:2.0 length:1.0];
    
    // Calculate and log their volumes
    NSLog(@"Box 1 Volume: %f", [box1 calculateVolume]);
    NSLog(@"Box 2 Volume: %f", [box2 calculateVolume]);
    
    // Find out how many times one box can fit inside the other
    float fitInside = [box1 howManyBoxesFitInside:box2];
    NSLog(@"Box 1 can fit inside Box 2 %.2f times.", fitInside);
  }
  return 0;
}
