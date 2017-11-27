//
//  UIView+Frame.m
//  BuDeJie01
//
//  Created by admin on 2017/11/2.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

+(instancetype)xmg_viewfromxib
{
    return  [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}
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
-(void)setXmg_height:(CGFloat)xmg_height
{
    CGRect rect=self.frame;
    rect.size.height=xmg_height;
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
-(CGFloat)xmg_centerX
{
    return self.center.x;
}
-(CGFloat)xmg_centerY
{
    return self.center.y;
}
-(void)setXmg_centerX:(CGFloat)xmg_centerX
{
    CGPoint center=self.center;
    center.x=xmg_centerX;
    self.center=center;
}
-(void)setXmg_centerY:(CGFloat)xmg_centerY
{
    CGPoint center=self.center;
    center.y=xmg_centerY;
    self.center=center;
}


@end
