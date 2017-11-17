//
//  XMGAllTableViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/7.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGAllTableViewController.h"
#import "XMGContentTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>
#import "XMGTopic.h"
#import <MJExtension/MJExtension.h>
static NSString * const ID=@"cell";
@interface XMGAllTableViewController ()
@property(nonatomic,strong)NSMutableArray *topic;
@end

@implementation XMGAllTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=XMGColor(100, 200, 300);
    self.tableView.contentInset = UIEdgeInsetsMake(99, 0, 49, 0);
    [self.tableView registerNib:[UINib nibWithNibName:@"XMGContentTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.scrollIndicatorInsets=self.tableView.contentInset;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tabBarButtonDidRepeatClick:) name:XMGTabBarButtonDidRepeatClickNotification object:nil];
    
    [self loadNewTopics];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 设置普通状态的动画图片 (idleImages 是图片)
    [header setImages:idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:pullingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    // 设置header
    self.tableView.mj_header = header;

    
}
-(void)loadtopicnew
{
    XMGFunc;
}
/**
 *  发送请求给服务器，下拉刷新数据
 */
- (void)loadNewTopics
{
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @"1"; // 这里发送@1也是可行的
    
    // 3.发送请求
    [mgr GET:XMGCommonURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
       
//        [responseObject writeToFile:[NSString stringWithFormat:@"/Users/admin/Documents/project/Budejienewest/%@.plist",@#filename] atomically:YES]
        XMGWritePlist(all);
        // 字典数组 -> 模型数据
        self.topic = [XMGTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 刷新表格
        [self.tableView reloadData];
//        
//        // 结束刷新
//        [self headerEndRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试！"];
        
        // 结束刷新
//        [self headerEndRefreshing];
    }];
}
-(void)dealloc
{
    XMGFunc;
    [[NSNotificationCenter defaultCenter]removeObserver:XMGTabBarButtonDidRepeatClickNotification];
}
-(void)tabBarButtonDidRepeatClick:(NSNotification *)nsn
{
    NSLog(@"%@",nsn);
    if (self.view.window == nil) return;
    if(self.tableView.scrollsToTop==NO)return;
    XMGFunc;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMGContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text=@"all";
    cell.topic=self.topic[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 222;
}


@end
