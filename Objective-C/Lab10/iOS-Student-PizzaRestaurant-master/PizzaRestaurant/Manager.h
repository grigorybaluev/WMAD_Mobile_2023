//
//  Manager.h
//  PizzaRestaurant
//
//  Created by MacBook on 16.09.2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KitchenDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Manager : NSObject <KitchenDelegate>

- (instancetype)initWithName:(NSString *)name;
- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings;
- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen;
- (void)kitchenDidMakePizza:(Pizza *)pizza;

@end


NS_ASSUME_NONNULL_END
