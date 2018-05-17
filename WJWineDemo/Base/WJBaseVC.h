//
//  WJBaseVC.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJBaseVC : UIViewController
@property(nonatomic,strong,readonly)WJBaseViewModel *viewModel;


- (instancetype)initWithViewModel:(WJBaseViewModel *)viewModel;

- (void)bindViewModel;
@end
