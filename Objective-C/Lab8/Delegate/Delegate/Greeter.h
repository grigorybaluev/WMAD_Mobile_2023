//
//  Greeter.h
//  Delegate
//
//  Created by MacBook on 15.09.2023.
//

#import <Foundation/Foundation.h>
#import "GreeterDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Greeter : NSObject

@property (nonatomic, weak) id<GreeterDelegate> delegate;
- (void)greet;

@end

NS_ASSUME_NONNULL_END

