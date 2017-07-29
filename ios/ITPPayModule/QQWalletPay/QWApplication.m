//
//  QWApplication.m
//  QQWalletSDK
//
//  Created by stonedong on 14-4-2.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWApplication.h"

#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

NSString* const kQWAppKeyNameQQ = @"name";
NSString* const kQWAppKeyUrlSchemeQQ = @"urlScheme";
NSString* const kQWAppKeySDKVersionQQ = @"sdkVersion";
NSString* const kQWAppKeyAPPIDQQ = @"appId";

@implementation QWApplication

+ (QWApplication*) sharedApplication{
    static QWApplication* shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[QWApplication alloc] init];
        shared.name = @"unknown application";
        shared.urlScheme = @"";
        shared.sdkVersion = @"1.0.0";
        shared.appId = @"invalid";
    });
    return shared;
}

- (NSString*) urlSchemePrefix{
    return [NSString stringWithFormat:@"%@://",_urlScheme];
}

- (NSDictionary*) dictionaryWithAllValues{
    return [self dictionaryWithValuesForKeys:@[kQWAppKeyUrlSchemeQQ, kQWAppKeySDKVersionQQ, kQWAppKeyNameQQ, kQWAppKeyAPPIDQQ]];
}
@end
