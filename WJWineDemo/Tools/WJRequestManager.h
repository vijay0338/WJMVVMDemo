//
//  WJRequestManager.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJRequestManager : NSObject

///本地数据（array）
+ (RACSignal *)postArrayDataWithURL:(NSString *)urlString
                       withpramater:(NSDictionary *)paremater;

///本地数据（dic）
+ (RACSignal *)postDicDataWithURL:(NSString *)urlString
                     withpramater:(NSDictionary *)paremater;

+ (RACSignal *)getWithURL:(NSString *)uslString
            withParamater:(NSDictionary *)paramter;

+ (RACSignal *)postWithURL:(NSString *)urlString
             withParamater:(NSDictionary *)parameter;

@end
