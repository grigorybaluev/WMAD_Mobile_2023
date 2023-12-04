//
//  main.m
//  FoodTruck
//
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoodTruck.h"
#import "Cook.h"
#import "StarChef.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    FoodTruck *truckA = [[FoodTruck alloc] initWithName:@"Take a Bao" andFoodType:@"bao"];
    
    FoodTruck *truckB = [[FoodTruck alloc] initWithName:@"Tim Shortons" andFoodType:@"shortbread"];
    
    FoodTruck *truckC = [[FoodTruck alloc] initWithName:@"Tim Shortons" andFoodType:@"shortbread"];
    
    // create instances of your delegate class
    Cook *cookA = [Cook new];
    Cook *cookB = [Cook new];
    StarChef *chef = [StarChef new];
    
    // set truckA and truckB's delegate to your new instance.
    truckA.delegate = cookA;
    truckB.delegate = cookB;
    truckC.delegate = chef;
    
    [truckA serve:10];
    [truckB serve:5];
    [truckC serve:5];
    
    [truckA cashOut];
    [truckB cashOut];
    [truckC cashOut];
  }
  return 0;
}
