//
//  XMGTopic.h
//  BuDeJie01
//
//  Created by admin on 2017/11/17.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,XMGTopicType) {
    XMGTopicTypeAll=1,
    XMGTopicTypePicture=10,
    XMGTopicTypeWord=29,
    XMGTopicTypeVoice=31,
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
@end
