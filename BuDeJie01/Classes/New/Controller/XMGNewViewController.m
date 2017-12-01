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
#import "XMGFindMe.h"
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
    
    
    UIButton *netbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [netbtn setTitle:@"网络状态" forState:UIControlStateNormal];
    [netbtn sizeToFit];
    [netbtn addTarget:self action:@selector(judgenet) forControlEvents:UIControlEventTouchUpInside];
    netbtn.frame=CGRectMake(100, 300, netbtn.frame.size.width, netbtn.frame.size.height);
    [self.view addSubview:netbtn];
    
    
    UIButton *getcityBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [getcityBtn setTitle:@"城市定位" forState:UIControlStateNormal];
    [getcityBtn sizeToFit];
    [getcityBtn addTarget:self action:@selector(getcity) forControlEvents:UIControlEventTouchUpInside];
    getcityBtn.frame=CGRectMake(100, 400, getcityBtn.frame.size.width, getcityBtn.frame.size.height);
    [self.view addSubview:getcityBtn];
    
}
/**
 城市定位
 */
-(void)getcity
{
    [[XMGFindMe shareFindMe]startLocation];
}

/**
 网络状态判断
 */
-(void)judgenet
{
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[@"network"]=@"WIFI";
    [[NSNotificationCenter defaultCenter]postNotificationName:ZYNotificationNetWorkChange object:nil userInfo:dict];
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
