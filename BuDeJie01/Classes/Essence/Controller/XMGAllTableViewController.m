//
//  XMGAllTableViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/7.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGAllTableViewController.h"
#import "XMGContentTableViewCell.h"
static NSString * const ID=@"cell";
@interface XMGAllTableViewController ()

@end

@implementation XMGAllTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=XMGColor(100, 200, 300);
    self.tableView.contentInset = UIEdgeInsetsMake(99, 0, 49, 0);
    [self.tableView registerNib:[UINib nibWithNibName:@"XMGContentTableViewCell" bundle:nil] forCellReuseIdentifier:ID];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tabBarButtonDidRepeatClick:) name:XMGTabBarButtonDidRepeatClickNotification object:nil];
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
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMGContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text=@"all";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 222;
}


@end
