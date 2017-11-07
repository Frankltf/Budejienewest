//
//  XMGNewViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGNewViewController.h"
#import "UIBarButtonItem+Item.h"
#import "XMGSubTagTableViewController.h"
@interface XMGNewViewController ()

@end

@implementation XMGNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor orangeColor];
    [self setupNavItem];
}

/**
 设置导航条
 */
-(void)setupNavItem
{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWith:@"MainTagSubIcon" heightImageName:@"MainTagSubIconClick-click" target:self action:@selector(topage) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.title=@"新帖";
    
}
-(void)topage
{
    XMGSubTagTableViewController *subtag=[[XMGSubTagTableViewController alloc]init];
    [self.navigationController pushViewController:subtag animated:YES];
}
@end
