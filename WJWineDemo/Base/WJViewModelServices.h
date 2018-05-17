//
//  WJViewModelServices.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WJBaseViewModel;
@protocol WJViewModelServices <NSObject>

- (void)pushViewModel:(WJBaseViewModel *)viewModel animated:(BOOL)animated;

- (void)popViewControllerWithAnimation:(BOOL)animated;

- (void)popToRootViewModelWithAnimation:(BOOL)animated;

- (void)presentViewModel:(WJBaseViewModel *)viewModel animated:(BOOL)animated complete:(void(^)(void))complete;

///模态弹出vc，用于alert
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void(^)(void))complete;


@end
