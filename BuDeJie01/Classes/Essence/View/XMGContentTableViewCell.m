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
        NSLog(@">>>>>>>>>>完成");
    }];
    
    self.toplabel.text=topic.name;
    self.bottomlabel.text=topic.text;
    self.rightlabel.text=topic.passtime;
    
    
    
}



@end
