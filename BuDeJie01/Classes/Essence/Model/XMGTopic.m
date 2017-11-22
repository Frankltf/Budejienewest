//
//  XMGTopic.m
//  BuDeJie01
//
//  Created by admin on 2017/11/17.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGTopic.h"

@implementation XMGTopic

-(CGFloat)cellHeight
{
    if(_cellHeight)return _cellHeight;
    _cellHeight+=55;
    CGSize textMaxSize=CGSizeMake(XMGScreenW-30, MAXFLOAT);
    _cellHeight += [self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height+15;
    _cellHeight += 35+15;
    if(self.top_cmt.count){
        _cellHeight += 21;
        
        NSDictionary *cmt=self.top_cmt.firstObject;
        NSString *content=cmt[@"content"];
        if(content.length == 0){
            content=@"语音评论";
        }
        NSString *username=cmt[@"user"][@"username"];
        NSString *cmtText=[NSString stringWithFormat:@"%@:%@",username,content];
        _cellHeight += [cmtText boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height+15;
        
    }
    XMGLog(@"%f",_cellHeight);
    return  _cellHeight;
    
}





@end
