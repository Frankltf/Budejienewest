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
#import <SDImageCache.h>
#import <MJExtension/MJExtension.h>
static NSString * const ID=@"cell";
@interface XMGAllTableViewController ()
@property(nonatomic,strong)NSMutableArray<XMGTopic *> *topic;

@property(nonatomic,weak)MJRefreshHeader *header;
@end

@implementation XMGAllTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor redColor];
    self.tableView.contentInset = UIEdgeInsetsMake(99, 0, 49, 0);
    [self.tableView registerNib:[UINib nibWithNibName:@"XMGContentTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.scrollIndicatorInsets=self.tableView.contentInset;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tabBarButtonDidRepeatClick:) name:XMGTabBarButtonDidRepeatClickNotification object:nil];
    [self setuprefresh];
}
# pragma 上下拉刷新
-(void)setuprefresh
{
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
    [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
    [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
    UIImage *image1=[UIImage imageNamed:@"cellmorebtnclick.png"];
    UIImage *image2=[UIImage imageNamed:@"cellmorebtnnormal.png"];
    UIImage *image3=[UIImage imageNamed:@"imageBackground.png"];
    //    NSArray *arr=@[image1,image2,image3];
    //    [header setImages:arr forState:MJRefreshStateIdle];
    NSArray *pullingImages = @[image1,image2,image3];
    [header setImages:pullingImages forState:MJRefreshStatePulling];
    //    header.lastUpdatedTimeLabel.hidden = YES;
    //    header.stateLabel.hidden = YES;
    self.tableView.mj_header = header;
//    self.tableView.estimatedRowHeight=100;
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData2)];
    [self.tableView.mj_header beginRefreshing];
}
-(void)loadMoreData2
{
    [self loadNewTopics];
}
-(void)loadNewData
{
    [self loadNewTopics];
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
    parameters[@"type"] = @"10"; // 这里发送@1也是可行的
    
    // 3.发送请求
    [mgr GET:XMGCommonURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
       
//        [responseObject writeToFile:[NSString stringWithFormat:@"/Users/admin/Documents/project/Budejienewest/%@.plist",@#filename] atomically:YES]
        XMGWritePlist(all);
        // 字典数组 -> 模型数据
        self.topic = [XMGTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView.mj_header endRefreshing];
         [self.tableView.mj_footer endRefreshing];
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

    [[NSNotificationCenter defaultCenter]removeObserver:XMGTabBarButtonDidRepeatClickNotification];
}
-(void)tabBarButtonDidRepeatClick:(NSNotification *)nsn
{

    if (self.view.window == nil) return;
    if(self.tableView.scrollsToTop==NO)return;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMGContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text=@"all";
//    XMGLog(@"%zd---%p",indexPath.row,cell);
    cell.topic=self.topic[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return self.topic[indexPath.row].cellHeight;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [[SDImageCache sharedImageCache]clearMemory];
}

@end
