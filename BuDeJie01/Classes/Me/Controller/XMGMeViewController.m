//
//  XMGMeViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGMeViewController.h"
#import "UIBarButtonItem+Item.h"
#import "XMGSettingViewController.h"
@interface XMGMeViewController ()

@end

@implementation XMGMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
    [self setupNavItem];
}


/**
 设置导航条
 */
-(void)setupNavItem
{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWith:@"MainTagSubIcon" heightImageName:@"MainTagSubIconClick-click" target:self action:@selector(topage) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.title=@"我的";
    
    UIBarButtonItem *settignbtn=[UIBarButtonItem itemWith:@"mine-setting-icon" heightImageName:@"mine-setting-icon-click" target:self action:@selector(tosetting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *nightbtn=[UIBarButtonItem itemWith:@"mine-moon-icon" heightImageName:@"mine-moon-icon-click" target:self action:@selector(tonight) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItems=@[settignbtn,nightbtn];
    
}
-(void)tosetting
{
    XMGSettingViewController *setting=[[XMGSettingViewController alloc]init];
    [self.navigationController pushViewController:setting animated:YES];
}
-(void)tonight
{
    
}
-(void)topage
{

}
@end
