//
//  UIImageView+Download.m
//  BuDeJie01
//
//  Created by admin on 2017/11/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIImageView+Download.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "XMGTopic.h"
@implementation UIImageView (Download)
-(void)originimage:(XMGTopic *)topic completed:(SDWebImageCompletionBlock)completedBlock
{
    UIImage *placeimage=nil;
    AFNetworkReachabilityManager *mgr=[AFNetworkReachabilityManager sharedManager];
    UIImage *originimage=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:topic.image1];
    if(originimage){
        self.image=originimage;
        completedBlock(originimage, nil, 0, [NSURL URLWithString:topic.image1]);
    }else{
        if(mgr.isReachableViaWiFi){

            [self sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:placeimage completed:completedBlock];
        }else if (mgr.isReachableViaWWAN){
            BOOL downloadOriginImageWhen3GOr4G = YES;
            if(downloadOriginImageWhen3GOr4G){
                [self sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:placeimage completed:completedBlock];
                
            }else{
                [self sd_setImageWithURL:[NSURL URLWithString:topic.image0] placeholderImage:placeimage completed:completedBlock];
            }
        }else{
            UIImage *thumbimage=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:topic.image0];
            if(thumbimage){
                self.image=thumbimage;
                completedBlock(thumbimage, nil, 0, [NSURL URLWithString:topic.image0]);
            }else{
                self.image=placeimage;
            }
        }
    }
}
@end
