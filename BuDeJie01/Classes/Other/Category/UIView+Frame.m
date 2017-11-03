//
//  UIView+Frame.m
//  BuDeJie01
//
//  Created by admin on 2017/11/2.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

-(void)setXmg_width:(CGFloat)xmg_width
{
    CGRect rect=self.frame;
    rect.size.width=xmg_width;
    self.frame=rect;
}
-(CGFloat)xmg_width
{
    CGRect rect=self.frame;
    return rect.size.width;
}
-(void)setXmg_heiht:(CGFloat)xmg_heiht
{
    CGRect rect=self.frame;
    rect.size.height=xmg_heiht;
    self.frame=rect;
}
-(CGFloat)xmg_height
{
    CGRect rect=self.frame;
    return rect.size.height;
}
-(void)setXmg_x:(CGFloat)xmg_x
{
    CGRect rect=self.frame;
    rect.origin.x=xmg_x;
    self.frame=rect;
}
-(CGFloat)xmg_x
{
    return self.frame.origin.x;
}
-(void)setXmg_y:(CGFloat)xmg_y
{
    CGRect rect=self.frame;
    rect.origin.y=xmg_y;
    self.frame=rect;
}
-(CGFloat)xmg_y
{
    return self.frame.origin.y;
}
@end
