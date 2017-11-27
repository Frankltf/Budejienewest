//
//  UIImageView+Download.h
//  BuDeJie01
//
//  Created by admin on 2017/11/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>
@class XMGTopic;
@interface UIImageView (Download)
-(void)originimage:(XMGTopic *)topic completed:(SDWebImageCompletionBlock)completedBlock;
@end
