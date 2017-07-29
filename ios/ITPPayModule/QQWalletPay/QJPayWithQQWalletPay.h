//
//  QJPayWithQQWalletPay.h
//  QJPayWithQQWalletPay
//
//  Created by linkyun on 16/11/15.
//  Copyright © 2016年 linkyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QJPayWithQQWalletPay : NSObject
+ (void)sendQQWalletSDKMessage:(NSString *)orderInfo andAppScheme:(NSString *)QQAppScheme response:(void(^)(int statusCode))responseResultBlock;

+ (BOOL)handleOpenURL:(NSURL *)url;

@end
