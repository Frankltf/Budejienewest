//
//  XMGCartCellTableViewCell.h
//  BuDeJie01
//
//  Created by admin on 2017/11/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGCartItem,XMGCartCellTableViewCell;

@protocol XMGCartCellTableViewDelegate <NSObject>
-(void)winecelladdfun:(XMGCartCellTableViewCell *)cell;
-(void)winecellreduesfun:(XMGCartCellTableViewCell *)cell;

@end

@interface XMGCartCellTableViewCell : UITableViewCell
@property(nonatomic,strong)XMGCartItem *winecell;
@property(nonatomic,weak)id<XMGCartCellTableViewDelegate>delegate;
@end
