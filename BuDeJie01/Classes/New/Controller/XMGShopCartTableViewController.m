//
//  XMGShopCartTableViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGShopCartTableViewController.h"
#import "XMGCartCellTableViewCell.h"
static NSString *const ID=@"cartcell";

@interface XMGShopCartTableViewController ()

@end

@implementation XMGShopCartTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    self.navigationItem.title=@"购物车";
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self editBtn];
    [self registerforcell];
}

# pragma 加载cell
/**
注册cell
 */
-(void)registerforcell
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGCartCellTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMGCartCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    return cell;
}



/**
 编辑按钮
 */
-(void)editBtn
{
    UIButton *editbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [editbtn setTitle:@"编辑" forState:UIControlStateHighlighted];
    [editbtn setTitle:@"编辑" forState:UIControlStateNormal];
    [editbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    editbtn.frame=CGRectMake(0, 0, 50, 40);
    [editbtn addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:editbtn];
    
}
-(void)edit
{
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
