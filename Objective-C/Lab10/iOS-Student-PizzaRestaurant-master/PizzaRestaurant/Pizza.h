//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by MacBook on 16.09.2023.
//  Copyright © 2023 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"

NS_ASSUME_NONNULL_BEGIN

//typedef NS_ENUM(NSInteger, PizzaSize) {
//  Small,
//  Medium,
//  Large
//};

@interface Pizza : NSObject

@property (nonatomic) PizzaSize size;
@property (nonatomic, strong) NSArray<NSString *> *toppings;

- (instancetype)initWithSize:(PizzaSize)size toppings:(NSArray<NSString *> *)toppings;

+ (Pizza *)largePepperoni;
+ (Pizza *)meatLoversWithSize:(PizzaSize)size;

@end

NS_ASSUME_NONNULL_END
