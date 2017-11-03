//
//  UIBarButtonItem+Item.h
//  BuDeJie01
//
//  Created by admin on 2017/11/2.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)
+(UIBarButtonItem *)itemWith:(NSString *)imageName heightImageName:(NSString *)heightImageName target:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
@end
