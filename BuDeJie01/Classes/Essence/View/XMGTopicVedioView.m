//
//  XMGTopicVedioView.m
//  BuDeJie01
//
//  Created by admin on 2017/11/22.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGTopicVedioView.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "XMGTopic.h"
@interface XMGTopicVedioView ()
@property (weak, nonatomic) IBOutlet UIImageView *vedioimage;
@property (weak, nonatomic) IBOutlet UILabel *toplabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomlabel;

@end
@implementation XMGTopicVedioView
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

-(void)setTopic:(XMGTopic *)topic
{
    _topic=topic;
   
    UIImage *placeimage=nil;
    AFNetworkReachabilityManager *mgr=[AFNetworkReachabilityManager sharedManager];
    UIImage *originimage=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:topic.image1];
    if(originimage){
        self.vedioimage.image=originimage;
    }else{
        if(mgr.isReachableViaWiFi){
            [self.vedioimage sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:placeimage];
        }else if (mgr.isReachableViaWWAN){
            BOOL downloadOriginImageWhen3GOr4G = YES;
            if(downloadOriginImageWhen3GOr4G){
                [self.vedioimage sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:placeimage];
                
            }else{
                [self.vedioimage sd_setImageWithURL:[NSURL URLWithString:topic.image0] placeholderImage:placeimage];
            }
        }else{
            UIImage *thumbimage=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:topic.image0];
            if(thumbimage){
                self.vedioimage.image=thumbimage;
            }else{
                self.vedioimage.image=placeimage;
            }
        }
    }
    self.toplabel.text=[NSString stringWithFormat:@"%ld 播放量",(long)topic.playcount];
    self.bottomlabel.text=[NSString stringWithFormat:@"%02zd:%02zd",topic.voicetime / 60,topic.voicetime % 60];
}
@end
