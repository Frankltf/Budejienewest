
//
//  XMGTopicVoiceView.m
//  BuDeJie01
//
//  Created by admin on 2017/11/22.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGTopicVoiceView.h"
#import "XMGTopic.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
@interface XMGTopicVoiceView ()
@property (weak, nonatomic) IBOutlet UIImageView *voiceimageview;
@property (weak, nonatomic) IBOutlet UILabel *toplabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomlabel;

@end

@implementation XMGTopicVoiceView

- (void)awakeFromNib
{
      [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}
- (IBAction)playbtn:(UIButton *)sender {
    
}
-(void)setTopic:(XMGTopic *)topic
{
    _topic=topic;
    UIImage *placeimage=nil;
    AFNetworkReachabilityManager *mgr=[AFNetworkReachabilityManager sharedManager];
    UIImage *originimage=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:topic.image1];
    if(originimage){
        self.voiceimageview.image=originimage;
    }else{
        if(mgr.isReachableViaWiFi){
            [self.voiceimageview sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:placeimage];
        }else if (mgr.isReachableViaWWAN){
            BOOL downloadOriginImageWhen3GOr4G = YES;
            if(downloadOriginImageWhen3GOr4G){
                [self.voiceimageview sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:placeimage];
                
            }else{
                [self.voiceimageview sd_setImageWithURL:[NSURL URLWithString:topic.image0] placeholderImage:placeimage];
            }
        }else{
            UIImage *thumbimage=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:topic.image0];
            if(thumbimage){
                self.voiceimageview.image=thumbimage;
            }else{
                self.voiceimageview.image=placeimage;
            }
        }
    }
    self.toplabel.text=[NSString stringWithFormat:@"%ld 播放量",(long)topic.playcount];
    self.bottomlabel.text=[NSString stringWithFormat:@"%02zd:%02zd",topic.voicetime / 60,topic.voicetime % 60];
}

@end
