//
//  KitchenDelegate.h
//  PizzaRestaurant
//
//  Created by MacBook on 16.09.2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//
//
@class Kitchen;
@class Pizza;
//#import "Pizza.h"
#ifndef KitchenDelegate_h
#define KitchenDelegate_h


//@protocol KitchenDelegate <NSObject>
//
//@property (nonatomic, weak) id<KitchenDelegate> delegate;
//
//- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings;
//- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen;
//@optional
////- (void)kitchenDidMakePizza:(Pizza *)pizza;
//
//@end
typedef NS_ENUM(NSInteger, PizzaSize) {
  Small,
  Medium,
  Large
};

@protocol KitchenDelegate <NSObject>

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings;
- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen;

@optional
- (void)kitchenDidMakePizza:(Pizza *)pizza;

@end

#endif /* KitchenDelegate_h */


