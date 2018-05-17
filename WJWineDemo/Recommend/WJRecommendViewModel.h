//
//  WJRecommendViewModel.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "WJBaseViewModel.h"

@interface WJRecommendViewModel : WJBaseViewModel

@property(nonatomic,strong)RACCommand *refershCommand;

@property(nonatomic,strong)RACCommand *shareCommand;

@end
