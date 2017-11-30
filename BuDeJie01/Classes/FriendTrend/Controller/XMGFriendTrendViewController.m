//
//  XMGFriendTrendViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGFriendTrendViewController.h"
#import "UIBarButtonItem+Item.h"
#import "XMGLoginViewController.h"
@interface XMGFriendTrendViewController ()

@end

@implementation XMGFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavItem];
}

/**
 设置导航条
 */
-(void)setupNavItem
{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWith:@"friendsRecommentIcon" heightImageName:@"friendsRecommentIcon-click" target:self action:@selector(topage) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.title=@"关注";

}
-(void)topage
{
    
}
- (IBAction)loginbtn:(UIButton *)sender {
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[@"network"]=@"None";
    [[NSNotificationCenter defaultCenter]postNotificationName:ZYNotificationNetWorkChange object:nil userInfo:dict];
    return;
    XMGLoginViewController *login=[[XMGLoginViewController alloc]init];
    [self presentViewController:login animated:YES completion:nil];
}
@end
