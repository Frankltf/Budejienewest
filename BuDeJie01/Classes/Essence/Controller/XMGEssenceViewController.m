//
//  XMGEssenceViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGEssenceViewController.h"
#import "UIBarButtonItem+Item.h"


@interface XMGEssenceViewController ()

@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor=[UIColor greenColor];
    [self setupNavItem];
}

/**
 设置导航条
 */
-(void)setupNavItem
{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWith:@"nav_item_game_icon" heightImageName:@"nav_item_game_click_icon" target:self action:@selector(topage) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.title=@"精华";
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWith:@"navigationButtonRandom" heightImageName:@"navigationButtonRandomClick" target:self action:@selector(topagetwo) forControlEvents:UIControlEventTouchUpInside];
}

-(void)topage
{
    
}
-(void)topagetwo
{
    
}

@end
