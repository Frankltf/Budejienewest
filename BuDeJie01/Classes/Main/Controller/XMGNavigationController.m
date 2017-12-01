//
//  XMGNavigationController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGNavigationController.h"
#import "UIBarButtonItem+Item.h"
@interface XMGNavigationController ()<UIGestureRecognizerDelegate,UIAlertViewDelegate>
@property(nonatomic,strong)UIView *networkStateView;
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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(netWorkChange:) name:ZYNotificationNetWorkChange object:nil];
}
-(void)netWorkChange:(NSNotification *)note
{
    NSDictionary *dict=note.userInfo;
    UIViewController *viewVc=self.childViewControllers.lastObject;
    NSLog(@"%@",self.childViewControllers);
    if([dict[@"network"]  isEqualToString: @"WIFI"]){
        [viewVc.view addSubview:self.networkStateView];
    }else{
        [self.networkStateView removeFromSuperview];
    }
}
-(UIView *)networkStateView
{
    if(_networkStateView == nil){
        _networkStateView = [[UIView alloc]init];
        _networkStateView.frame=CGRectMake(0, 100, XMGScreenW, 30);
        _networkStateView.backgroundColor=[UIColor redColor];
        UILabel *label=[[UILabel alloc]init];
        label.text=@"网络无法连接";
        label.frame=CGRectMake(15, 0, 100, 30);
        label.backgroundColor=[UIColor grayColor];
        [_networkStateView addSubview:label];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickNetWork:)];
        [_networkStateView addGestureRecognizer:tap];
    }
    return _networkStateView;
}
-(void)clickNetWork:(UITapGestureRecognizer *)tap
{
    UIAlertView *reLogin=[[UIAlertView alloc]initWithTitle:@"重新连接服务器？" message:@"重新连接" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [reLogin show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    
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
