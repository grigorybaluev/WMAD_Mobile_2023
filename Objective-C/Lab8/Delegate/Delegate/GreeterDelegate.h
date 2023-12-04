//
//  GreaterDelegate.h
//  Delegate
//
//  Created by MacBook on 15.09.2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GreeterDelegate <NSObject>

- (BOOL)shouldSayHello;

@end

NS_ASSUME_NONNULL_END
