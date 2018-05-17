//
//  WJBaseVC.m
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "WJBaseVC.h"

@interface WJBaseVC ()
@property(nonatomic,strong,readwrite)WJBaseViewModel *viewModel;
@end

@implementation WJBaseVC

- (instancetype)initWithViewModel:(WJBaseViewModel *)viewModel
{
    if (self == [super init])
    {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor   = WJCOLOR(240, 240, 240, 1);
    self.viewModel.naviImpl             = [[WJViewModelNavigationImpl alloc]initWithNavigationController:self.navigationController];
}


- (void)bindViewModel
{
    RAC(self.navigationItem,title)     = RACObserve(self.viewModel, title);
}

@end
