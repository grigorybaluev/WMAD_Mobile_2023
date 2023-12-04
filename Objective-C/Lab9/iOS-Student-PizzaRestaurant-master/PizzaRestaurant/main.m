//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"
#import "Kitchen.h"


int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    // Example of creating pizzas using constructor methods
    Pizza *pepperoniPizza = [Pizza largePepperoni];
    Pizza *meatLoversPizza = [Pizza meatLoversWithSize:Medium];

    NSLog(@"%@", pepperoniPizza);
    NSLog(@"%@", meatLoversPizza);
    
    // Loop for custom pizza
    NSLog(@"Please pick your pizza size and toppings:");
    Kitchen *restaurantKitchen = [Kitchen new];
    
    while (TRUE) {
      // Loop forever
      NSLog(@"> ");
      char str[100];
      fgets(str, 100, stdin);
      
      NSString *inputString = [[NSString alloc] initWithUTF8String:str];
      inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
      
      NSLog(@"Input was %@", inputString);
      
      // Take the first word of the command as the size, and the rest as the toppings
      NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
      
      // Ensure that we have at least one word
      if ([commandWords count] >= 2) {
        NSString *sizeString = commandWords[0];
        NSArray<NSString *> *toppings = [commandWords subarrayWithRange:NSMakeRange(1, [commandWords count] - 1)];
        
        PizzaSize size = Small;
        if ([sizeString isEqualToString:@"Medium"]) {
          size = Medium;
        } else if ([sizeString isEqualToString:@"Large"]) {
          size = Large;
        }
        
        // Send a message to the kitchen to make the custom pizza
        Pizza *customPizza = [Kitchen makePizzaWithSize:size toppings:toppings];
        NSLog(@"Cooking your custom pizza: %@", customPizza);
      } else {
        NSLog(@"Invalid input. Please provide a pizza size and at least one topping.");
      }
    }
  }
  return 0;
}
