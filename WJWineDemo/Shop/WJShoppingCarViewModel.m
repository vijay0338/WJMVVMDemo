//
//  WJShoppingCarViewModel.m
//  WJWineDemo
//
//  Created by Adward on 2018/5/9.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "WJShoppingCarViewModel.h"

@implementation WJShoppingCarViewModel

-(instancetype)initWithService:(id<WJViewModelServices>)service params:(NSDictionary *)params
{
    if (self = [super initWithService:service params:params]) {
        [self initViewModel];
    }
    return self;
}

- (void)initViewModel
{
    @weakify(self);
    self.emptySubject           = [RACSubject subject];
    // - 监听价格
    [RACObserve([WJShoppingManager manager], changed) subscribeNext:^(id x) {
        static BOOL isFirst;//是否是第一次检测到没有选中。用来避免多次改变selectAllBtn
        isFirst                 = YES;
        SHOPPING_MANAGER.flag   = YES;
        NSDictionary *dic       = SHOPPING_MANAGER.goodsDic;
        [[dic allValues] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            @strongify(self);
            WJGood *good = obj;
            if(isFirst && !good.w_isSelected && !self.isClickAllBtn)
            {
                //                self.selectAllBtn.selected = !self.selectAllBtn;
                isFirst = NO;
                self.btnState = NO;
            }
            if (idx == 0)
            {
                SHOPPING_MANAGER.price = 0;
            }
            if (good.w_isSelected)
            {
                SHOPPING_MANAGER.price += good.price * good.num;
            }
            if (idx == [dic allValues].count - 1 && isFirst && !self.isClickAllBtn)
            {
                self.btnState = YES;
            }
            if(idx == [dic allValues].count - 1)
            {
                //                self.isClickAllBtn = NO;
                self.isClickAllBtn = NO;
            }
            //            self.priceLabel.text    = [NSString stringWithFormat:@"共¥ %.2f",SHOPPING_MANAGER.price];
            self.price = [NSString stringWithFormat:@"共¥ %.2f",SHOPPING_MANAGER.price];
        }];
        SHOPPING_MANAGER.flag = NO;
        [self.emptySubject sendNext:@([dic allValues].count)];
        
    }];
}

@end
