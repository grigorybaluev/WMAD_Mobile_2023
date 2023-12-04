#import <Foundation/Foundation.h>

@interface Box : NSObject

@property (nonatomic, assign) float height;
@property (nonatomic, assign) float width;
@property (nonatomic, assign) float length;

- (instancetype)initWithHeight:(float)height width:(float)width length:(float)length;
- (float)calculateVolume;
- (float)howManyBoxesFitInside:(Box *)otherBox;

@end
