//
//  WJViewModelNavigationImpl.m
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "WJViewModelNavigationImpl.h"

@interface WJViewModelNavigationImpl()
@property(nonatomic,weak)UINavigationController *navigationController;
@end

@implementation WJViewModelNavigationImpl

-(instancetype)initWithNavigationController:(UINavigationController *)navi
{
    if (self = [super init]) {
        _navigationController = navi;
    }
    return self;
}

- (void)popViewControllerWithAnimation:(BOOL)animated
{
    if (!_navigationController)
    {
        NSLog(@"没有导航");
        return;
    }
    
    [_navigationController popViewControllerAnimated:animated];
}
- (void)popToRootViewModelWithAnimation:(BOOL)animated
{
    if (!_navigationController)
    {
        NSLog(@"没有导航");
        return;
    }
    
    [_navigationController popToRootViewControllerAnimated:animated];
}

- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void (^)(void))complete {
    if (!_navigationController)
    {
        return;
    }
    [_navigationController presentViewController:viewController animated:animated completion:complete];
}

- (void)presentViewModel:(WJBaseViewModel *)viewModel animated:(BOOL)animated complete:(void (^)(void))complete {
    WJBaseVC *vc = [[NSClassFromString(_className) alloc]initWithViewModel:viewModel];
    if (!vc)
    {
        NSLog(@"VC名字错误");
        return;
    }
    [_navigationController presentViewController:vc animated:animated completion:complete];
}

- (void)pushViewModel:(WJBaseViewModel *)viewModel animated:(BOOL)animated {
    WJBaseVC *vc = [[NSClassFromString(_className) alloc]initWithViewModel:viewModel];
    if (!vc)
    {
        NSLog(@"VC名字错误");
        return;
    }
    [_navigationController pushViewController:vc animated:animated];
}

@end
