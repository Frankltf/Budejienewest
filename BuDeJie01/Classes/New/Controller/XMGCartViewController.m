//
//  XMGCartViewController.m
//  BuDeJie01
//
//  Created by admin on 2017/11/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGCartViewController.h"
#import "XMGCartCellTableViewCell.h"
#import <MJExtension/MJExtension.h>
#import "XMGCartItem.h"
static NSString *const ID=@"cartcell";
@interface XMGCartViewController () <UITableViewDelegate,UITableViewDataSource,XMGCartCellTableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *carttable;
@property(nonatomic,strong)NSArray *wineData;
@property (weak, nonatomic) IBOutlet UILabel *totalmoney;
@property(strong,nonatomic)NSMutableArray *shoparr;
@end

@implementation XMGCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self editBtn];
        [self.carttable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.carttable.delegate=self;
    self.carttable.dataSource=self;
    self.navigationItem.title=@"购物车";
    [self registerforcell];
}
-(NSMutableArray *)shoparr
{
    if(!_shoparr){
        _shoparr=[NSMutableArray array];
    }
    return _shoparr;
}
/**
 懒加载数据
 */
-(NSArray *)wineData
{
    if(!_wineData){
        _wineData=[XMGCartItem mj_objectArrayWithFilename:@"wine.plist"];
        
    }
    return _wineData;
}

/**
 编辑按钮
 */
-(void)editBtn
{
    UIButton *editbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [editbtn setTitle:@"清空" forState:UIControlStateHighlighted];
    [editbtn setTitle:@"清空" forState:UIControlStateNormal];
    [editbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    editbtn.frame=CGRectMake(0, 0, 50, 40);
    [editbtn addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:editbtn];
    
}

#pragma XMGCartCellTableViewDelegate
-(void)winecelladdfun:(XMGCartCellTableViewCell *)cell
{
    int totalmoney=self.totalmoney.text.intValue + cell.winecell.money.intValue;
    self.totalmoney.text=[NSString stringWithFormat:@"%d",totalmoney];
    if(![self.shoparr containsObject:cell.winecell]){
       [self.shoparr addObject:cell.winecell];
    }
    XMGLog(@"%@",self.shoparr);
}
-(void)winecellreduesfun:(XMGCartCellTableViewCell *)cell
{
    int totalmoney=self.totalmoney.text.intValue - cell.winecell.money.intValue;
    self.totalmoney.text=[NSString stringWithFormat:@"%d",totalmoney];
    [self.shoparr removeObject:cell.winecell];
    XMGLog(@"%@",self.shoparr);
}


-(void)edit
{
    XMGLog(@"333");
    XMGLog(@"%@",self.shoparr);
    for(XMGCartItem *cell in self.shoparr){
        cell.buycount=0;
    }
    [self.carttable reloadData];
    self.totalmoney.text=@"0";
    [self.shoparr removeAllObjects];
}
-(void)registerforcell
{
    [self.carttable registerNib:[UINib nibWithNibName:NSStringFromClass([XMGCartCellTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.wineData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMGCartCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.winecell=self.wineData[indexPath.row];
    cell.delegate=self;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
@end
