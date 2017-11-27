//
//  UIImage+Image.m
//  BuDeJie01
//
//  Created by admin on 2017/11/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+(UIImage *)imageOriginalWithName:(NSString *)imageName
{
    
    UIImage *image=[UIImage imageNamed:imageName];
    return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}



@end
