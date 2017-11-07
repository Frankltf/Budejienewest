//
//  XMGSettingViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGSettingViewController.h"
#import "XMGFileTool.h"

@interface XMGSettingViewController ()
@property(nonatomic,weak)UIButton *btn;
@property(nonatomic,assign)CGFloat totalSize;
@property(nonatomic,strong)NSString *sizeStr;
@end

@implementation XMGSettingViewController

-(NSString *)sizeStr
{
    if(_sizeStr == nil){
        _sizeStr=[NSString stringWithFormat:@"清除缓存(%.1f)MB",self.totalSize];
        
    }
    return _sizeStr;
}
-(CGFloat)totalSize
{
    if(_totalSize == 0){
        _totalSize=0.1;
        
    }
    return  _totalSize;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    [self setupNavItem];
    UIButton *setting=[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn=setting;
    [setting setTitle:self.sizeStr forState:UIControlStateNormal];
    [setting setTitle:@"清除中" forState:UIControlStateHighlighted];
    setting.frame=CGRectMake(0, 100, 300, 30);
    setting.backgroundColor=[UIColor redColor];
    [setting addTarget:self action:@selector(clearbtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setting];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path=[paths firstObject];
    [XMGFileTool getMemory:path completion:^(NSInteger a) {
        [self sizeStrwith:a];
    }];
}
-(void)sizeStrwith:(NSInteger)totalSize
{
    NSString *sizeStr=@"清除缓存";
    if(totalSize > 1000*1000){
        CGFloat sizef=totalSize/(1000*1000);
        sizeStr=[NSString stringWithFormat:@"%@(%.1f)MB",sizeStr,sizef];
        self.totalSize=sizef;
    }else if(totalSize>1000){
        CGFloat sizef=totalSize/(1000);
        sizeStr=[NSString stringWithFormat:@"%@(%.1f)KB",sizeStr,sizef];
        self.totalSize=sizef;
    }else if(totalSize>0){
         CGFloat sizef=totalSize;
        sizeStr=[NSString stringWithFormat:@"%@(%.1f)KB",sizeStr,sizef];
        self.totalSize=sizef;
    }
    

    
    self.sizeStr=sizeStr;
    self.btn.titleLabel.text=sizeStr;
    NSLog(@"%@",sizeStr);
}






-(void)clearbtn
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path=[paths firstObject];
    [XMGFileTool clearMemory:path];
    self.btn.titleLabel.text=@"已清除";
}

-(void)setupNavItem
{
    self.navigationItem.title=@"设置";
    

    
}

@end
