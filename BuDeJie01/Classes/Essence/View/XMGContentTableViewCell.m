//
//  XMGContentTableViewCell.m
//  BuDeJie01
//
//  Created by admin on 2017/11/7.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGContentTableViewCell.h"
#import "XMGTopic.h"
#import <UIImageView+WebCache.h>
#import "XMGTopicVedioView.h"
#import "XMGTopicVoiceView.h"
#import "XMGTopicPictureView.h"


@interface XMGContentTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *toplabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomlabel;
@property (weak, nonatomic) IBOutlet UILabel *rightlabel;
@property (weak, nonatomic) IBOutlet UIView *pinglunview;
@property (weak, nonatomic) IBOutlet UILabel *pingluntext;

@property(nonatomic,weak)XMGTopicVedioView *vedioview;
@property(nonatomic,weak)XMGTopicVoiceView *voiceview;
@property(nonatomic,weak)XMGTopicPictureView *picture;


@end

@implementation XMGContentTableViewCell


-(XMGTopicVedioView *)vedioview
{
    if(!_vedioview){
        NSLog(@"aaaaaaa");
        XMGTopicVedioView *vedioview=[XMGTopicVedioView xmg_viewfromxib];
        [self addSubview:vedioview];
        _vedioview = vedioview;
    }
    return  _vedioview;
    
}
-(XMGTopicVoiceView *)voiceview
{
    if(!_voiceview){
        NSLog(@"bbbbbb");
        XMGTopicVoiceView *voiceview=[XMGTopicVoiceView xmg_viewfromxib];
        [self addSubview:voiceview];
        _voiceview = voiceview;
    }
    return  _voiceview;
}
-(XMGTopicPictureView *)picture
{
    if(!_picture){
         NSLog(@"ccccccc");
        XMGTopicPictureView *picture=[XMGTopicPictureView xmg_viewfromxib];
        [self addSubview:picture];
        _picture = picture;
    }
    return  _picture;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

-(void)setTopic:(XMGTopic *)topic
{
    _topic=topic;
    
    UIImage *placeholder=[UIImage imageNamed:@"defaultUserIcon"];
    [self.image sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    
    [self addxibfromview:topic];
    if(topic.top_cmt.count){
        self.pinglunview.hidden=NO;
        NSDictionary *cmt = topic.top_cmt.firstObject;
        NSString *content = cmt[@"content"];
        if (content.length == 0) { // 语音评论
            content = @"[语音评论]";
        }
        NSString *username = cmt[@"user"][@"username"];
        self.pingluntext.text = [NSString stringWithFormat:@"%@ : %@", username, content];
    }else{
        self.pinglunview.hidden=YES;
    }
    self.toplabel.text=topic.name;
    self.bottomlabel.text=topic.passtime;
    self.rightlabel.text=topic.text;
}
-(void)addxibfromview:(XMGTopic *)topic
{
    switch (topic.type) {
        case XMGTopicTypePicture:
            self.vedioview.hidden=YES;
            self.voiceview.hidden=YES;
            self.picture.hidden=NO;
            self.picture.topic=topic;
            break;
        case XMGTopicTypeVoice:
            self.vedioview.hidden=YES;
            self.voiceview.hidden=NO;
            self.voiceview.topic=topic;
            self.picture.hidden=YES;
            break;
        case XMGTopicTypeVideo:
            self.vedioview.hidden=NO;
            self.vedioview.hidden=YES;
            self.vedioview.topic=topic;
            self.voiceview.hidden=YES;
            break;
        case XMGTopicTypeWord:
            self.vedioview.hidden=YES;
            self.voiceview.hidden=YES;
            self.picture.hidden=YES;
            break;
        default:
            
            break;
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"%@",NSStringFromCGRect(self.topic.middleFrame));

    switch (self.topic.type) {
        case XMGTopicTypePicture:
            self.picture.frame=self.topic.middleFrame;
        
            break;
        case XMGTopicTypeVoice:
            self.voiceview.frame=self.topic.middleFrame;
            break;
        case XMGTopicTypeVideo:
            self.vedioview.frame=self.topic.middleFrame;
            break;
        case XMGTopicTypeWord:
            
            break;
        default:
            
            break;
    }
}

@end
