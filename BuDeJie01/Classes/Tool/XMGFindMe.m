//
//  XMGFindMe.m
//  BuDeJie01
//
//  Created by admin on 2017/12/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGFindMe.h"
#import <CoreLocation/CoreLocation.h>

@interface XMGFindMe ()<CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation XMGFindMe

+(instancetype)shareFindMe
{
    static XMGFindMe *findMe=nil;
    static dispatch_once_t twoToken;
    dispatch_once(&twoToken, ^{
        findMe=[[XMGFindMe alloc]init];
    });
    return findMe;
}
-(void)startLocation
{
    if([CLLocationManager locationServicesEnabled]){
        self.locationManager=[[CLLocationManager alloc]init];
        self.locationManager.delegate=self;  //设置代理
        self.locationManager.distanceFilter=100;   //设置多少米去更新 一次位置信息
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;  //设置定位精度
        [self.locationManager startUpdatingLocation];
    }
}


#pragma CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            if([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
                [self.locationManager requestWhenInUseAuthorization];
                XMGLog(@"请同意定位服务");
            }
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            if([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
                [self.locationManager requestWhenInUseAuthorization];
                NSLog(@"定位服务授权状态仅被允许在使用应用程序的时候");
            }
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            if([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
                [self.locationManager requestWhenInUseAuthorization];
                NSLog(@"定位服务授权状态已经被用户允许在任何状态下获取位置信息。包括监测区域、访问区域、或者在有显著的位置变化的时候");
            }
            break;
        case kCLAuthorizationStatusDenied:
            NSLog(@"被用户拒绝");
            break;
        default:
            break;
    }
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *curlocation=locations.lastObject;
    NSLog(@"%@",curlocation);
    NSLog(@"%@",curlocation.timestamp);
    NSTimeInterval locationage=[curlocation.timestamp timeIntervalSinceNow];
    if (locationage > 5.0) return;
    [self.locationManager stopUpdatingLocation];
    
    CLLocation *location=locations.lastObject;
    NSLog(@"%@",location);
    [self reverseGeocoder:location];
}
-(void)reverseGeocoder:(CLLocation *)location
{
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if(error){
            
        }else{
            CLPlacemark *placemark=placemarks.firstObject;
            NSLog(@"%@",placemark);
            NSString *city = [[placemark addressDictionary] objectForKey:@"City"];
            NSLog(@"%@",city);
        }
    }];
}

@end
