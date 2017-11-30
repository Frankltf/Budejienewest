//
//  XMGNetWork.m
//  BuDeJie01
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGNetWork.h"
#import "Reachability.h"

@interface XMGNetWork ()
@property (nonatomic) Reachability *internetReachability;


@end

@implementation XMGNetWork

+(instancetype)shareNetWork
{
    static XMGNetWork *NewWork=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NewWork=[[XMGNetWork alloc]init];
    });
    return NewWork;
}

-(void)judgeNetWork
{
    Reachability *internetReachability=nil;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    self.internetReachability=[Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    [self updateInterfaceWithReachability:self.internetReachability];
    
    
}

-(void)updateInterfaceWithReachability:(Reachability *)internetReachability
{
    NetworkStatus netStatus=[internetReachability currentReachabilityStatus];
    BOOL connectedToNetWork=[internetReachability connectedToNetwork];
    if(connectedToNetWork){
        NSLog(@"newwork is ok");
    }
    NSString *statusString=@"";
    switch (netStatus) {
        case NotReachable:
            statusString=@"None";
            break;
        case ReachableViaWWAN:
            statusString=@"WWAN";
            break;
        case ReachableViaWiFi:
            statusString=@"WIFi";
            break;
        default:
            break;
    }
    NSLog(@"%@",statusString);
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[@"network"]=connectedToNetWork?statusString:@"None";
    [[NSNotificationCenter defaultCenter]postNotificationName:ZYNotificationNetWorkChange object:self userInfo:dict];
}

-(void)reachabilityChanged:(NSNotification *)noti
{
    Reachability *internetReachability=[noti object];
    [self updateInterfaceWithReachability:internetReachability];
}
@end
