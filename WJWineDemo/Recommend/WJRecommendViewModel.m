//
//  WJRecommendViewModel.m
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "WJRecommendViewModel.h"

@implementation WJRecommendViewModel

- (instancetype)initWithService:(id<WJViewModelServices>)service params:(NSDictionary *)params
{
    self = [super initWithService:service params:params];
    if (self)
    {
        [self initViewModel];
    }
    return self;
}

- (void)initViewModel
{
    @weakify(self);
    self.refershCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        [[WJRequestManager postWithURL:@"http://www.jiuyunda.net:90/api/v1/shareIntegral/share_info" withParamater:@{@"userinfo_id":[WJUser currentUser].bid,@"customer_id":@"57f8ac945b73294b2d7a97ad"}] subscribeNext:^(id x) {
            NSLog(@"%@",x);
        }];
        
        return [RACSignal empty];
    }];
    
    self.shareCommand   = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self share];
        
        return [RACSignal empty];
    }];
}
- (void)share{

}

@end
