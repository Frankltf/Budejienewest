//
//  XMGSubTagCell.m
//  BuDeJie01
//
//  Created by admin on 2017/11/4.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGSubTagCell.h"
#import "XMGSubtagItem.h"
#import "UIImage+Image.h"
#import <UIImageView+WebCache.h>

@interface XMGSubTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIButton *orderbtn;
@property (weak, nonatomic) IBOutlet UILabel *toplabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomlabel;


@end

@implementation XMGSubTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(void)setItem:(XMGSubtagItem *)item
{
    _item=item;
    self.toplabel.text=item.theme_name;
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        [path addClip];
        [image drawAtPoint:CGPointZero];
        image=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndPDFContext();
        _imageview.image=image;
    }];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
