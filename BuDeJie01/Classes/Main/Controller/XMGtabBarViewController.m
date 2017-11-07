//
//  XMGtabBarViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGtabBarViewController.h"
#import "XMGEssenceViewController.h"
#import "XMGFriendTrendViewController.h"
#import "XMGPublishViewController.h"
#import "XMGNewViewController.h"
#import "XMGMeViewController.h"
#import "UIImage+Image.h"
#import "XMGTabBar.h"
#import "XMGNavigationController.h"
@interface XMGtabBarViewController ()

@end

@implementation XMGtabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [self resetUpTabBar];
      [self setUpTabBar];
  
  
}
-(void)resetUpTabBar
{
    XMGTabBar *tabbar=[[XMGTabBar alloc]init];
    [self setValue:tabbar forKey:@"tabBar"];
}

/**
 初始化tabbar
 */
-(void)setUpTabBar
{
    XMGEssenceViewController *essence=[[XMGEssenceViewController alloc]init];
    XMGNavigationController *nav1=[[XMGNavigationController alloc]initWithRootViewController:essence];
    [self addChildViewController:nav1];
    [self setupTabBarTitleWith:nav1 titleName:@"精华" imageName:@"tabBar_essence_icon" selectImageName:@"tabBar_essence_click_icon"];

    
    
    XMGFriendTrendViewController *friendTrend=[[XMGFriendTrendViewController alloc]init];
    XMGNavigationController *nav2=[[XMGNavigationController alloc]initWithRootViewController:friendTrend];
    [self addChildViewController:nav2];
    [self setupTabBarTitleWith:nav2 titleName:@"关注" imageName:@"tabBar_friendTrends_icon" selectImageName:@"tabBar_friendTrends_click_icon"];



    
    XMGNewViewController *new=[[XMGNewViewController alloc]init];
    XMGNavigationController *nav4=[[XMGNavigationController alloc]initWithRootViewController:new];
    [self addChildViewController:nav4];
    [self setupTabBarTitleWith:nav4 titleName:@"帖" imageName:@"tabBar_new_icon" selectImageName:@"tabBar_new_click_icon"];
    
    XMGMeViewController *me=[[XMGMeViewController alloc]init];
    XMGNavigationController *nav5=[[XMGNavigationController alloc]initWithRootViewController:me];
    [self addChildViewController:nav5];
    [self setupTabBarTitleWith:nav5 titleName:@"我的" imageName:@"tabBar_me_icon" selectImageName:@"tabBar_me_click_icon"];
}

/**
    添加tabbar标题图片
 */
-(void)setupTabBarTitleWith:(UINavigationController *)nav titleName:(NSString *)titleName imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
    if(titleName){
        nav.tabBarItem.title=titleName;
        NSMutableDictionary *dic=[NSMutableDictionary dictionary];
        dic[NSFontAttributeName]=[UIFont systemFontOfSize:13];
        [nav.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
        
        NSMutableDictionary *dic2=[NSMutableDictionary dictionary];
        dic2[NSForegroundColorAttributeName]=[UIColor blackColor];
        [nav.tabBarItem setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    }
    nav.tabBarItem.image=[UIImage imageNamed:imageName];
    nav.tabBarItem.selectedImage=[UIImage imageOriginalWithName:selectImageName];
}

@end
