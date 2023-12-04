//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by MacBook on 16.09.2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (instancetype)initWithSize:(PizzaSize)size toppings:(NSArray<NSString *> *)toppings {
  self = [super init];
  if (self) {
    _size = size;
    _toppings = toppings;
  }
  return self;
}

+ (Pizza *)largePepperoni {
  NSArray<NSString *> *toppings = @[@"Pepperoni", @"Cheese"];
  return [[Pizza alloc] initWithSize:Large toppings:toppings];
}

+ (Pizza *)meatLoversWithSize:(PizzaSize)size {
  NSArray<NSString *> *toppings = @[@"Pepperoni", @"Sausage", @"Bacon", @"Ham", @"Cheese"];
  return [[Pizza alloc] initWithSize:size toppings:toppings];
}

- (NSString *)description {
  NSString *sizeString;
  switch (self.size) {
    case Small:
      sizeString = @"Small";
      break;
    case Medium:
      sizeString = @"Medium";
      break;
    case Large:
      sizeString = @"Large";
      break;
    default:
      sizeString = @"Unknown";
      break;
  }
  
  return [NSString stringWithFormat:@"%@ Pizza with toppings: %@", sizeString, [self.toppings componentsJoinedByString:@", "]];
}

@end
