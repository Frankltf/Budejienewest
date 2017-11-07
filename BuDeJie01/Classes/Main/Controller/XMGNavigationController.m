//
//  XMGNavigationController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGNavigationController.h"
#import "UIBarButtonItem+Item.h"
@interface XMGNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XMGNavigationController

+(void)load
{
    UINavigationBar *navappearanch=[UINavigationBar appearance];
    NSMutableDictionary *attr=[NSMutableDictionary dictionary];
    attr[NSFontAttributeName]=[UIFont systemFontOfSize:24];
    [navappearanch setTitleTextAttributes:attr];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count>1;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.childViewControllers.count>0){
        [viewController setHidesBottomBarWhenPushed:YES];
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem backitemWith:@"navigationButtonReturn" heightImageName:@"navigationButtonReturnClick" target:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside title:@"返回"];
    }
    [super pushViewController:viewController animated:animated];
    
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}
@end
