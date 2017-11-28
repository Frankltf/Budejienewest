//
//  XMGCartCellTableViewCell.m
//  BuDeJie01
//
//  Created by admin on 2017/11/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGCartCellTableViewCell.h"
#import "XMGCartItem.h"
@interface XMGCartCellTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *goodsimage;
@property (weak, nonatomic) IBOutlet UILabel *goodsprice;
@property (weak, nonatomic) IBOutlet UILabel *goodsname;
@property (weak, nonatomic) IBOutlet UILabel *buynum;


@end

@implementation XMGCartCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
        self.selectionStyle=UITableViewCellSelectionStyleNone;
}
-(void)setWinecell:(XMGCartItem *)winecell
{
    _winecell=winecell;
    self.goodsimage.image=[UIImage imageNamed:winecell.image];
    self.goodsprice.text=winecell.money;
    self.goodsname.text=winecell.name;
    self.buynum.text=[NSString stringWithFormat:@"%d",winecell.buycount];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setFrame:(CGRect)frame
{
    frame.size.height -= 10;
    [super setFrame:frame];
}
- (IBAction)reducebtn:(UIButton *)sender {
    if(self.winecell.buycount == 0){
        return;
    }
    self.winecell.buycount --;
    XMGLog(@"%d",self.winecell.buycount);
    self.buynum.text=[NSString stringWithFormat:@"%d",self.winecell.buycount];
    if([self.delegate respondsToSelector:@selector(respondsToSelector:)]){
        [self.delegate winecellreduesfun:self];
    }
    
    
}
- (IBAction)addbtn:(UIButton *)sender {
    self.winecell.buycount ++;
    XMGLog(@"%d",self.winecell.buycount);
    self.buynum.text=[NSString stringWithFormat:@"%d",self.winecell.buycount];
    if([self.delegate respondsToSelector:@selector(winecelladdfun:)]){
         [self.delegate winecelladdfun:self];
    }
   
}

@end
