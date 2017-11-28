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
#import "XMGShopCartTableViewController.h"
#import "XMGCartViewController.h"
@interface XMGNewViewController ()

@end

@implementation XMGNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor orangeColor];
    [self setupNavItem];
    
    
    UIButton *cartbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [cartbtn setImage:[UIImage imageNamed:@"cartRed"] forState:UIControlStateNormal];
    [cartbtn sizeToFit];
    [cartbtn addTarget:self action:@selector(toShopCart) forControlEvents:UIControlEventTouchUpInside];
    cartbtn.frame=CGRectMake(100, 200, cartbtn.frame.size.width, cartbtn.frame.size.height);
    [self.view addSubview:cartbtn];
    
}
/**
 去购物车
 */
-(void)toShopCart
{
    XMGCartViewController *shopCart=[[XMGCartViewController alloc]init];
    [self.navigationController pushViewController:shopCart animated:YES];
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
