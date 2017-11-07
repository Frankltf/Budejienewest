//
//  XMGViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <UIImageView+WebCache.h>
#import "XMGAditem.h"
#import "XMGtabBarViewController.h"
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface XMGViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIButton *daojishi;
@property(nonatomic,strong)XMGAditem *item;
@property(nonatomic,weak)   NSTimer *timer;
@end

@implementation XMGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    [self loaddata];
    [self timeChange];
    
}
-(void)setupgep
{
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toad)];
    [self.imageview addGestureRecognizer:tap];
    self.imageview.userInteractionEnabled=YES;
}
-(void)toad
{
    
    NSURL *url=[NSURL URLWithString:_item.ori_curl];
    
    UIApplication *app=[UIApplication sharedApplication];
    if([app canOpenURL:url]){
        [app openURL:url];
    }
}
- (IBAction)tojump:(UIButton *)sender {
    XMGtabBarViewController *tabbar=[[XMGtabBarViewController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController=tabbar;
    [self.timer invalidate];
}
-(void)timeChange
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(numberchange) userInfo:nil repeats:YES];
}
-(void)numberchange
{
    static NSInteger i=1;
    i--;
    self.daojishi.titleLabel.text=[NSString stringWithFormat:@"点击跳转0%ld",i];

    if(i==0){
        [self tojump:nil];
        [self.timer invalidate];
    }
}
-(void)loaddata
{
    AFHTTPSessionManager *mgr=[AFHTTPSessionManager manager];
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [responseObject writeToFile:@"/Users/admin/Documents/tengfei/BuDeJie01/ad.plist" atomically:YES];
        NSDictionary *addic=[responseObject[@"ad"] firstObject];
        _item=[XMGAditem mj_objectWithKeyValues:addic];
        self.imageview.frame=CGRectMake(0, 0, self.item.w, self.item.h);
        [self.imageview sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
        [self setupgep];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


@end
