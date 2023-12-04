//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"
#import "Pizza.h"

@implementation Kitchen

+ (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray<NSString *> *)toppings {
  return [[Pizza alloc] initWithSize:size toppings:toppings];
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

@end
