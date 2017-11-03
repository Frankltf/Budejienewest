//
//  XMGPublishViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGPublishViewController.h"

@interface XMGPublishViewController ()

@end

@implementation XMGPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    [self setupNavItem];
}


/**
 设置导航条
 */
-(void)setupNavItem
{
    self.navigationItem.title=@"发布";
    
}
-(void)topage
{
    
}
@end
