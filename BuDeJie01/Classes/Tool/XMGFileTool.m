//
//  XMGFileTool.m
//  BuDeJie01
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGFileTool.h"

@implementation XMGFileTool

+(void)clearMemory:(NSString *)directoryPath
{
    NSFileManager *mgr=[NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL isExist=[mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    if(!isExist || !isDirectory){
        NSException *exp=[NSException exceptionWithName:@"pathError" reason:@"笨蛋 此处需要传入的是文件夹路径" userInfo:nil];
        [exp raise];
    }
    NSArray *paths=[mgr contentsOfDirectoryAtPath:directoryPath error:nil];
    for(NSString *subpath in paths){
        NSString *filepath=[directoryPath stringByAppendingString:subpath];
        [mgr removeItemAtPath:filepath error:nil];
    }
}

+(void)getMemory:(NSString *)directoryPath completion:(void(^)(NSInteger))completion
{
    NSFileManager *mgr=[NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL isExist=[mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    if(!isExist || !isDirectory){
        NSException *exp=[NSException exceptionWithName:@"pathError" reason:@"笨蛋 此处需要传入的是文件夹路径" userInfo:nil];
        [exp raise];
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *subpaths=[mgr subpathsAtPath:directoryPath];
        NSInteger totalsize=0;
        for(NSString *subpath in subpaths){
            NSString *filepath=[directoryPath stringByAppendingPathComponent:subpath];
            if([filepath containsString:@".DS"]){
                continue;
            }
            BOOL isDirectory;
            BOOL isExist=[mgr fileExistsAtPath:filepath isDirectory:&isDirectory];
            if(! isExist || isDirectory){
                continue;
            }
            NSDictionary *attr=[mgr attributesOfItemAtPath:filepath error:nil];
            NSInteger fileSize=[attr fileSize];
            totalsize += fileSize;
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            if(completion){
                completion(totalsize);
            }
        });
    });
}






@end
