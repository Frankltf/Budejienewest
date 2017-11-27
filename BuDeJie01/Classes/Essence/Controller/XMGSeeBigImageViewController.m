//
//  XMGSeeBigImageViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGSeeBigImageViewController.h"
#import <UIImageView+WebCache.h>
#import "XMGTopic.h"
@interface XMGSeeBigImageViewController () <UIScrollViewDelegate>
@property(nonatomic,weak)UIImageView *imageview;
@end

@implementation XMGSeeBigImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollview=[[UIScrollView alloc]init];
    scrollview.frame=[UIScreen mainScreen].bounds;
    [self.view insertSubview:scrollview atIndex:0];
    UIImageView *imageview=[[UIImageView alloc]init];
    [imageview sd_setImageWithURL:[NSURL URLWithString:self.topic.image1] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if(!image)return;
    }];
    imageview.xmg_width=scrollview.xmg_width;
    imageview.xmg_height=imageview.xmg_width * self.topic.height / self.topic.width;
    imageview.xmg_x=0;
    if(imageview.xmg_height > XMGScreenH){
        imageview.xmg_y=0;
        scrollview.contentSize=CGSizeMake(0, imageview.xmg_height);
    }else{
        imageview.xmg_centerY=scrollview.xmg_height * 0.5 ;
    }
    [scrollview addSubview:imageview];
    self.imageview=imageview;
    CGFloat maxsale=self.topic.width/imageview.xmg_width;
    if(maxsale > 1){
        scrollview.maximumZoomScale=maxsale;
        scrollview.delegate=self;
    }
    
    
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageview;
}

- (IBAction)savebtn:(UIButton *)sender {
}
- (IBAction)backbtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
