//
//  WJDataManager.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJDataManager : NSObject

/**
 *  保存用户数据
 */
+ (void)saveUserData;

/**
 *  读取用户数据
 */
+ (void)readUserData;

/**
 *  删除用户数据
 */
+ (void)removeUserData;

@end
