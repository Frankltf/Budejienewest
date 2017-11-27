//
//  XMGTopicPictureView.m
//  BuDeJie01
//
//  Created by admin on 2017/11/22.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGTopicPictureView.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "XMGTopic.h"
#import "UIImageView+Download.h"
#import "XMGSeeBigImageViewController.h"
@interface XMGTopicPictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureimage;
@property (weak, nonatomic) IBOutlet UIImageView *gitimage;
@property (weak, nonatomic) IBOutlet UIImageView *placeimage;
@property (weak, nonatomic) IBOutlet UIButton *bigbtn;


@end

@implementation XMGTopicPictureView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    self.pictureimage.userInteractionEnabled=YES;
    UIGestureRecognizer *addlisten=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(seeBig)];
    [self.pictureimage addGestureRecognizer:addlisten];
}
-(void)seeBig
{
    XMGSeeBigImageViewController *seebig=[[XMGSeeBigImageViewController alloc]init];
    seebig.topic=self.topic;
    [self.window.rootViewController presentViewController:seebig animated:YES completion:nil];
}
- (IBAction)bigbtn:(UIButton *)sender {
}


-(void)setTopic:(XMGTopic *)topic
{
    _topic=topic;
   [self.pictureimage originimage:topic completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       if(!image)return;
       self.placeimage.hidden=YES;
       
       if(topic.isBigpic){
           CGFloat imageW=topic.middleFrame.size.width;
           CGFloat imageH=imageW * topic.height /topic.width;
           UIGraphicsBeginImageContext(CGSizeMake(imageW, imageH));
           [self.pictureimage.image drawInRect:CGRectMake(0, 0, imageW, imageH)];
           self.pictureimage.image=UIGraphicsGetImageFromCurrentImageContext();
           UIGraphicsEndImageContext();
       }

   }];
    if(topic.isBigpic){
        self.bigbtn.hidden=NO;
        self.pictureimage.contentMode=UIViewContentModeTop;
        self.pictureimage.clipsToBounds=YES;
    }else{
        self.bigbtn.hidden=YES;
        self.pictureimage.contentMode=UIViewContentModeScaleToFill;
        self.pictureimage.clipsToBounds=NO;
    }
}
- (IBAction)seebigimage:(UIButton *)sender {
}
@end
