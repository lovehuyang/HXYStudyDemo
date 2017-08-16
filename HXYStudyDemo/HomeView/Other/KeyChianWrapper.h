//
//  KeyChianObject.h
//  HXYStudyDemo
//
//  Created by tzsoft on 2017/8/16.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>
@interface KeyChianWrapper : NSObject
/**
 *  用KeyChaina去保存用户名和密码
 */
+(void)save:(NSString *)service data:(id)data;
/**
 *  从KeyChina取出用户名和密码
 */
+(id)load:(NSString *)service;
/**
 *  从KeyChina中删除用户名和密码
 */
+ (void)delete:(NSString *)service;

@end
