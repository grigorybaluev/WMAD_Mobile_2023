//
//  StarChef.h
//  Foodtruck
//
//  Created by MacBook on 16.09.2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoodTruck.h"

NS_ASSUME_NONNULL_BEGIN

@interface StarChef<FoodTruckDelegate> : NSObject

-(double)foodTruck:(FoodTruck *)truck priceForFood:(NSString *)food;

@end

NS_ASSUME_NONNULL_END
