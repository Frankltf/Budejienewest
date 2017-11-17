//
//  XMGContentTableViewCell.m
//  BuDeJie01
//
//  Created by admin on 2017/11/7.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGContentTableViewCell.h"
#import "XMGTopic.h"
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
}

-(void)setTopic:(XMGTopic *)topic
{
    _topic=topic;
    self.toplabel.text=topic.name;
    self.bottomlabel.text=topic.text;
    self.rightlabel.text=topic.passtime;
    
}



@end
