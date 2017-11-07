
//
//  XMGSubTagTableViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/4.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGSubTagTableViewController.h"
#import "XMGSubTagCell.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <SVProgressHUD.h>
#import "XMGSubtagItem.h"

static NSString * const ID =@"cell";

@interface XMGSubTagTableViewController ()
@property(nonatomic,strong)NSArray *subTags;
@end

@implementation XMGSubTagTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.view.backgroundColor=[UIColor darkGrayColor];
    self.navigationItem.title=@"订阅";
    [self zhucecell];
    [SVProgressHUD showWithStatus:@"加载中。。。"];
}

-(void)zhucecell
{
    [self.tableView registerNib:[UINib nibWithNibName:@"XMGSubTagCell" bundle:nil] forCellReuseIdentifier:ID];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subTags.count;
}
-(void)loadData
{
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [responseObject writeToFile:@"/Users/admin/Documents/tengfei/BuDeJie01/new.plist" atomically:YES];
        self.subTags=[XMGSubtagItem mj_objectArrayWithKeyValuesArray:responseObject];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [SVProgressHUD dismiss];
    }];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMGSubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
   XMGSubtagItem *item=self.subTags[indexPath.row];
    cell.item=item;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}



@end
