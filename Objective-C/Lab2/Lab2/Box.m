#import "Box.h"

@implementation Box

- (instancetype)initWithHeight:(float)height width:(float)width length:(float)length {
  self = [super init];
  if (self) {
    _height = height;
    _width = width;
    _length = length;
  }
  return self;
}

- (float)calculateVolume {
  return self.height * self.width * self.length;
}

- (float)howManyBoxesFitInside:(Box *)otherBox {
  float selfVolume = [self calculateVolume];
  float otherVolume = [otherBox calculateVolume];
  
  if (selfVolume > otherVolume) {
    return selfVolume / otherVolume;
  } else {
    return otherVolume / selfVolume;
  }
}

@end
