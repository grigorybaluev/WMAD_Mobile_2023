//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "KitchenDelegate.h"
#import "Kitchen.h"
#import "Pizza.h"


Kitchen *_delegate;

@implementation Kitchen




@synthesize _delegate;

+ (Kitchen *)getDelegate {
    return _delegate;
}

//+ (void)setDelegate:(Kitchen *)kitchen {
//  _delegate = kitchen;
//}

+ (Pizza *)makePizzaOfSize:(PizzaSize)size toppings:(NSArray<NSString *> *)toppings {

  if ([self.getDelegate respondsToSelector:@selector(kitchen:shouldMakePizzaOfSize:andToppings:)]) {
//    BOOL shouldMakePizza = [self.getDelegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings];
    BOOL shouldMakePizza = YES;
    if (!shouldMakePizza) {
      NSLog(@"Pizza order canceled by the manager.");
      return nil;
    }
  }
  
  if ([self.getDelegate respondsToSelector:@selector(kitchenShouldUpgradeOrder:)]) {
//    BOOL shouldUpgradeOrder = [self.getDelegate kitchenShouldUpgradeOrder:self];
    BOOL shouldUpgradeOrder = NO;
    if (shouldUpgradeOrder) {
      NSLog(@"Order upgraded to a large pizza.");
      size = Large;
    }
  }
  
  Pizza *pizza = [[Pizza alloc] initWithSize:size toppings:toppings];
  
  if ([self.getDelegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
    [self.getDelegate kitchenDidMakePizza:pizza];
  }
  
  return pizza;
}

+ (Pizza *)makeCustomPizza {
  char input[255];
  printf("Enter pizza size (Small, Medium, Large): ");
  fgets(input, sizeof(input), stdin);
  NSString *sizeInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
  sizeInput = [sizeInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  
  printf("Enter pizza toppings separated by commas: ");
  fgets(input, sizeof(input), stdin);
  NSString *toppingsInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
  toppingsInput = [toppingsInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  NSArray<NSString *> *toppings = [toppingsInput componentsSeparatedByString:@","];
  
  PizzaSize size = Small;
  if ([sizeInput isEqualToString:@"Medium"]) {
    size = Medium;
  } else if ([sizeInput isEqualToString:@"Large"]) {
    size = Large;
  }
  
  return [[Pizza alloc] initWithSize:size toppings:toppings];
}

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings { 
  if ([toppings containsObject:@"anchovies"]) {
      NSLog(@"%@ refuses to make pizzas with anchovies.", NSStringFromClass([self class]));
      return NO;
  }
  return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen { 
  return NO;
}

@end
