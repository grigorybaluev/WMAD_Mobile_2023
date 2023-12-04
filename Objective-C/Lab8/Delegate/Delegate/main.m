//
//  main.m
//  Delegate
//
//  Created by MacBook on 15.09.2023.
//

#import <Foundation/Foundation.h>
#import "Greeter.h"
#import "FriendlyGreetingDecider.h"
#import "AngryGreeterDecider.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    Greeter *greeter = [Greeter new];  // [[Greeter alloc] init];
    
    FriendlyGreetingDecider *friendly = [FriendlyGreetingDecider new];
    AngryGreeterDecider *angry = [AngryGreeterDecider new];
    
    [greeter setDelegate:friendly];
//    greeter.delegate = angry;
    
    [greeter greet];
    
  }
  return 0;
}
