//
//  Greeter.m
//  Delegate
//
//  Created by MacBook on 15.09.2023.
//

#import "Greeter.h"

@implementation Greeter

- (void)greet {
  if ([_delegate shouldSayHello]) {
    NSLog(@"Hello!");
  } else {
    NSLog(@"...");
  }
}

@end
