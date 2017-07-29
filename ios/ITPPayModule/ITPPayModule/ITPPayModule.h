//
//  ITPPayModule.h
//  ITPPayModule
//
//  Created by linkyun on 17/7/28.
//  Copyright © 2017年 ruiruijiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import "QJPaySDK.h"

@interface ITPPayModule : NSObject<RCTBridgeModule,QJPayManagerDelegate>

@end
