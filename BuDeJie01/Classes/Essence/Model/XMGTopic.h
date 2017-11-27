//
//  XMGTopic.h
//  BuDeJie01
//
//  Created by admin on 2017/11/17.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,XMGTopicType) {
     /** 全部 */
    XMGTopicTypeAll=1,
     /** 图片 */
    XMGTopicTypePicture=10,
     /** 段子 */
    XMGTopicTypeWord=29,
    /** 声音 */
    XMGTopicTypeVoice=31,
    /** 视频 */
    XMGTopicTypeVideo=41,
};


@interface XMGTopic : NSObject



@property (nonatomic, copy) NSString *name;
/** 用户的头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 帖子的文字内容 */
@property (nonatomic, copy) NSString *text;
/** 帖子审核通过的时间 */
@property (nonatomic, copy) NSString *passtime;

/** 顶数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发\分享数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论数量 */
@property (nonatomic, assign) NSInteger comment;
/** 计算当前模型cell的高度*/
@property(nonatomic,assign)CGFloat  cellHeight;

/**  帖子类型  10为图片。29为段子。 31为音频。41为视频*/
@property(nonatomic,assign)NSInteger type;
/** 最热评论*/
@property(nonatomic,strong)NSArray *top_cmt;

/** 宽度(像素) */
@property (nonatomic, assign) NSInteger width;
/** 高度(像素) */
@property (nonatomic, assign) NSInteger height;

@property(nonatomic,assign)CGRect middleFrame;

@property(nonatomic,copy)NSString *image0;
@property(nonatomic,copy)NSString *image2;
@property(nonatomic,copy)NSString *image1;

@property(nonatomic,assign)NSInteger voicetime;
@property(nonatomic,assign)NSInteger videotime;
@property(nonatomic,assign)NSInteger playcount;
@property(nonatomic,assign,getter=isBigpic) BOOL bigpic;

@end
