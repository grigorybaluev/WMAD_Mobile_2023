//
//  StarChef.m
//  Foodtruck
//
//  Created by MacBook on 16.09.2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import "StarChef.h"


@implementation StarChef

-(double)foodTruck:(FoodTruck *)truck priceForFood:(NSString *)food {
  if ([food isEqualToString:@"bao"]) {
    return 20.0;
  } else if ([food isEqualToString:@"shortbread"]) {
    return 14.0;
  } else {
    return 10.0;
  }
}

@end
