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
@interface XMGContentTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *toplabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomlabel;
@property (weak, nonatomic) IBOutlet UILabel *rightlabel;
@property (weak, nonatomic) IBOutlet UIView *pinglunview;
@property (weak, nonatomic) IBOutlet UILabel *pingluntext;

@end

@implementation XMGContentTableViewCell

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



@end
