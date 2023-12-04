//
//  Kitchen.h
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

//#import <Foundation/Foundation.h>
//#import "Pizza.h"
//#import "KitchenDelegate.h"
//
//@interface Kitchen : NSObject
//
//@property (nonatomic, weak) id<KitchenDelegate> delegate;
//
//+ (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray<NSString *> *)toppings;
//+ (Pizza *)makeCustomPizza;
////- (id<KitchenDelegate>)getDelegate;
//
//@end

#import <Foundation/Foundation.h>
#import "KitchenDelegate.h"
#import "Pizza.h"


//@protocol KitchenDelegate; // Forward declaration to avoid circular dependencies

@interface Kitchen : NSObject <KitchenDelegate>

@property (nonatomic, weak) id<KitchenDelegate> _delegate; // Declare the delegate property


+ (Kitchen *)getDelegate;
//+ (void)setDelegate:(Kitchen *)kitchen;
+ (Pizza *)makePizzaOfSize:(PizzaSize)size toppings:(NSArray<NSString *> *)toppings;
+ (Pizza *)makeCustomPizza;

@end
