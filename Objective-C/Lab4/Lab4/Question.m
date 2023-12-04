#import "Question.h"

@implementation Question

- (instancetype)init {
  self = [super init];
  if (self) {
    _rightValue = arc4random_uniform(10) + 1;
    _leftValue = arc4random_uniform(10) + 1;
  }
  return self;
}

- (NSTimeInterval)timeToAnswer {
  return [self.endTime timeIntervalSinceDate:self.startTime];
}

- (void)generateQuestion {
  // Subclasses will implement this method
}

@end
