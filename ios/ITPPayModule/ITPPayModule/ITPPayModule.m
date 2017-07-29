//
//  ITPPayModule.m
//  ITPPayModule
//
//  Created by linkyun on 17/7/28.
//  Copyright © 2017年 ruiruijiang. All rights reserved.
//

#import "ITPPayModule.h"
#import "QJPaySDK.h"


@implementation ITPPayModule
RCTResponseSenderBlock tpCallback;

RCT_EXPORT_MODULE(ITPPayModule);


RCT_EXPORT_METHOD(itppay:(NSDictionary *)paramDict tpCallback:(RCTResponseSenderBlock)callback)
{
    
    
    @try {
        NSString * amount = [paramDict objectForKey:@"amount"];
        NSString * appid = [paramDict objectForKey:@"appid"];
        NSString * body = [paramDict objectForKey:@"body"];
        NSString * mchntOrderNo = [paramDict objectForKey:@"mchntOrderNo"];
        NSString * subject = [paramDict objectForKey:@"subject"];
        NSString * notifyUrl = [paramDict objectForKey:@"notifyUrl"];
        NSString * extra = [paramDict objectForKey:@"extra"];
        NSString * payChannelIds = [paramDict objectForKey:@"payStyle"];
        NSString * appkey = [paramDict objectForKey:@"appkey"];
        NSString * urlScheme = [paramDict objectForKey:@"appScheme"];
        
        UIViewController * viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        NSMutableDictionary * _handleDic = [NSMutableDictionary dictionaryWithObjects:@[amount,appid,body,notifyUrl,mchntOrderNo,subject,payChannelIds,extra] forKeys:@[@"amount",@"appid",@"body",@"notifyUrl",@"mchntOrderNo",@"subject",@"payChannelId",@"extra"]];
        NSLog(@"字典---dictionary %@",_handleDic);
        dispatch_sync(dispatch_get_main_queue(), ^{
            [QJPaySDK QJPayStart:_handleDic AppScheme:urlScheme appKey:appkey andCurrentViewController:viewController andDelegate:self Flag:0x80];
            
        });
        
        tpCallback=callback;
        
        
    } @catch (NSException *exception) {
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"字段异常" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        
        
    }
    
    
    
    
}


-(void)QJPayResponseResult:(int)response description:(NSString *)des{
    NSLog(@"tp reasult is  %d",response);

    NSString *stringInt = [NSString stringWithFormat:@"%d",response];

    tpCallback(@[stringInt,des]);

}


- (NSDictionary *)constantsToExport
{
    NSMutableDictionary * payChannel = [NSMutableDictionary dictionaryWithObjects:@[[QJPaySDK PAY_APLIPAY],[QJPaySDK PAY_WEIXIN],[QJPaySDK PAY_JINGDONG],[QJPaySDK PAY_UNION],[QJPaySDK PAY_UNIONAPPLE],[QJPaySDK PAY_QQWALLETSDK],[QJPaySDK PAY_PONITCART],[QJPaySDK PAY_BAIDU]] forKeys:@[@"ALIPAY",@"WECHAT",@"JD",@"UNIONPAY",@"UNIONAPPLEPAY",@"QQ",@"DK",@"BD"]];
    return payChannel;
}


- (NSString *)getUrlScheme {
NSArray *urlSchemeList = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleURLTypes"];
if ([urlSchemeList count] == 0) {
    return nil;
}
NSDictionary *urlSchemeType = [urlSchemeList objectAtIndex:0];
NSArray *schemes = [urlSchemeType objectForKey:@"CFBundleURLSchemes"];
if ([schemes count] == 0) {
    return nil;
}
return [schemes objectAtIndex:0];
}

@end
