//
//  Manager.m
//  PizzaRestaurant
//
//  Created by MacBook on 16.09.2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import "Manager.h"
#import "Pizza.h"
#import "Kitchen.h"

@implementation Manager

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        // Initialization code if needed
    }
    return self;
}

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    // Check for anchovies and refuse to make the pizza if found
    if ([toppings containsObject:@"anchovies"]) {
        NSLog(@"%@ refuses to make pizzas with anchovies.", NSStringFromClass([self class]));
        return NO;
    }
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    // Managers don't upgrade orders by default
    return NO;
}

- (void)kitchenDidMakePizza:(Pizza *)pizza {
    // Optional method, can be implemented for additional behavior
    NSLog(@"%@ says: Enjoy your pizza!", NSStringFromClass([self class]));
}

@end
