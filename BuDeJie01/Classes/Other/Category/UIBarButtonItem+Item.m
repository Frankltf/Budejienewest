//
//  UIBarButtonItem+Item.m
//  BuDeJie01
//
//  Created by admin on 2017/11/2.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)

+(UIBarButtonItem *)itemWith:(NSString *)imageName heightImageName:(NSString *)heightImageName target:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:heightImageName] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    UIView *btnview=[[UIView alloc]initWithFrame:btn.bounds];
    [btnview addSubview:btn];
    [btn addTarget:target action:action forControlEvents:controlEvents];
    return [[UIBarButtonItem alloc]initWithCustomView:btnview];
}

@end
