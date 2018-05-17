//
//  WJHomeViewModel.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "WJBaseViewModel.h"

@interface WJHomeViewModel : WJBaseViewModel

/**刷新数据*/
@property(nonatomic,strong)RACCommand   *refreshCommand;

@property(nonatomic,strong)NSArray      *headData;

@property(nonatomic,strong)NSArray      *dataArray;

///头视图
@property(nonatomic,strong)RACCommand   *headCommand;

///中间按钮点击
@property(nonatomic,strong)RACCommand   *btnCommand;

///good
@property(nonatomic,strong)RACCommand   *goodCommand;

///导航栏
@property(nonatomic,strong)RACCommand   *naviCommand;

@property(nonatomic,strong)RACSubject   *searchSubject;

@end
