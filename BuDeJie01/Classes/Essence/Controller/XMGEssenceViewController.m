//
//  XMGEssenceViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/7.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGEssenceViewController.h"
#import "XMGAllTableViewController.h"
#import "XMGVideoTableViewController.h"
#import "XMGVoiceTableViewController.h"
#import "XMGPictureTableViewController.h"
#import "XMGWordTableViewController.h"



@interface XMGEssenceViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak)UIScrollView *scrollview;
@property(nonatomic,weak)UIButton *previousbtn;
@property(nonatomic,weak)UIButton *nextbtn;
@property(nonatomic,weak)UIView *titleview;
@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildCon];
    [self setupscroll];
    [self setupTitleview];
    self.navigationItem.title=@"精华";
}
/**
 设置子控制器
 */
-(void)setupChildCon
{
    [self addChildViewController:[[XMGAllTableViewController alloc]init]];
    [self addChildViewController:[[XMGVideoTableViewController alloc]init]];
    [self addChildViewController:[[XMGVoiceTableViewController alloc]init]];
    [self addChildViewController:[[XMGPictureTableViewController alloc]init]];
    [self addChildViewController:[[XMGWordTableViewController alloc]init]];
}
/**
 设置scrollview
 */
-(void)setupscroll
{
    UIScrollView *scrollview=[[UIScrollView alloc]init];
    self.scrollview=scrollview;
    scrollview.frame=self.view.bounds;
    scrollview.pagingEnabled=YES;
    scrollview.backgroundColor=[UIColor redColor];
    [self.view addSubview:scrollview];
    scrollview.delegate=self;
    CGFloat scrollvieww=self.view.bounds.size.width;
    CGFloat scrollviewh=self.view.bounds.size.height;
    NSUInteger count=self.childViewControllers.count;
    for(NSUInteger i=0;i<count;i++){
        UIView *childview=self.childViewControllers[i].view;
        childview.frame=CGRectMake(i * scrollvieww, 0, scrollvieww, scrollviewh);
        [self.scrollview addSubview:childview];
    }
    scrollview.contentSize=CGSizeMake(count * scrollvieww, 0);
}

/**
 设置标题栏
 */
-(void)setupTitleview
{
    UIView *titleview=[[UIView alloc]init];
    self.titleview=titleview;
    titleview.frame=CGRectMake(0, 64, self.view.bounds.size.width, 35);
    titleview.backgroundColor=[UIColor darkGrayColor];
    [self.view addSubview:titleview];
    NSArray *titles=@[@"全部",@"视频",@"声音",@"图片",@"段子"];
    CGFloat btnw=self.view.bounds.size.width/titles.count;
    CGFloat btnh=35;
    for(NSInteger i=0;i<titles.count;i++){
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.tag=99+i;
        btn.frame=CGRectMake(i*btnw, 0, btnw, btnh);
        if(i == 0){
            [self navbtn:btn];
        }
        [btn addTarget:self action:@selector(navbtn:) forControlEvents:UIControlEventTouchUpInside];
        [titleview addSubview:btn];
    }
    
}
-(void)navbtn:(UIButton *)btn
{
    if(btn == self.previousbtn){
        return;
    }
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.previousbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.previousbtn=btn;
    NSInteger index=btn.tag;
    CGFloat offsetx=(index-99)*self.view.bounds.size.width;
    [UIView animateWithDuration:0.25 animations:^{
        self.scrollview.contentOffset=CGPointMake(offsetx, self.scrollview.contentOffset.y);
    } completion:^(BOOL finished) {
        
    }];
    
}
# pragma mark - <UIScrollViewDelegate>
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
    UIButton *btn=self.titleview.subviews[index];
    [self navbtn:btn];
}

@end
