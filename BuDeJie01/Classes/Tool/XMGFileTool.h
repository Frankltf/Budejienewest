//
//  XMGFileTool.h
//  BuDeJie01
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGFileTool : NSObject
+(void)clearMemory:(NSString *)directoryPath;
+(void)getMemory:(NSString *)directoryPath completion:(void(^)(NSInteger))completion;

@end
