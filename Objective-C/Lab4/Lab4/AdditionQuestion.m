#import "AdditionQuestion.h"

@implementation AdditionQuestion

- (instancetype)init {
  if (self = [super init]) {
    [self generateQuestion];
  }
  return self;
}

- (void)generateQuestion {
  self.answer = self.leftValue + self.rightValue;
  self.question = [NSString stringWithFormat:@"%ld + %ld ?", (long)self.leftValue, (long)self.rightValue];
}

@end
