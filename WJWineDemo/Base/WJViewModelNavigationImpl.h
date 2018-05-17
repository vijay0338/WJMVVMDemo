//
//  WJViewModelNavigationImpl.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJViewModelNavigationImpl : NSObject<WJViewModelServices>

@property(nonatomic,copy)NSString *className;
///设置当前rootVC
@property(nonatomic,assign)NSInteger selectedIndex;
- (instancetype)initWithNavigationController:(UINavigationController *)navi;

@end
