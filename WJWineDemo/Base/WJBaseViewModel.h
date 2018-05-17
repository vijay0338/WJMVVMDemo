//
//  WJBaseViewModel.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WJViewModelNavigationImpl.h"

@interface WJBaseViewModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong,readonly)id<WJViewModelServices> services;
@property(nonatomic,strong)WJViewModelNavigationImpl *naviImpl;
@property (nonatomic, copy, readonly) NSDictionary *params;
- (instancetype)initWithService:(id<WJViewModelServices>)service params:(NSDictionary *)params;

@end
