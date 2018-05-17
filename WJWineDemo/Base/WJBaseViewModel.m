//
//  WJBaseViewModel.m
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "WJBaseViewModel.h"
@interface WJBaseViewModel()
@property(nonatomic,strong,readwrite)id<WJViewModelServices> services;
@property (nonatomic, copy, readwrite) NSDictionary *params;
@end

@implementation WJBaseViewModel
- (instancetype)initWithService:(id<WJViewModelServices>)service params:(NSDictionary *)params
{
    self = [super init];
    if (self)
    {
        self.title      = params[@"title"];
        self.params     = params;
        self.services   = service;
    }
    return self;
}

- (BOOL)judgeWhetherLogin:(BOOL)goLogin
{
    return NO;
    
}
@end
