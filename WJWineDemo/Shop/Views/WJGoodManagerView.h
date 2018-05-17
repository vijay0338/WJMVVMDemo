//
//  WJGoodManagerView.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/9.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WJGoodManagerView : UIView

///已添加购物车数量
@property (nonatomic, assign) NSInteger num;

/// 添加到购物车
@property(nonatomic,strong)RACSubject   *addSubject;

///移除时发送信号
@property(nonatomic,strong)RACSubject   *reduceSubject;

- (void)updateGood:(WJGood *)good;

@end
