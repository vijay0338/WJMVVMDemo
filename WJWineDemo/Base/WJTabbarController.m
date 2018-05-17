//
//  WJTabbarController.m
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "WJTabbarController.h"
#import "WJHomeVC.h"
#import "WJHomeViewModel.h"
#import "WJNavaigationController.h"
#import "WJCategoryVC.h"
#import "WJCategoryViewModel.h"
#import "WJFoundVC.h"
#import "WJFoundViewModel.h"
#import "WJShoppingCarVC.h"
#import "WJShoppingCarViewModel.h"
#import "WJMeVC.h"
#import "WJMeViewModel.h"

@interface WJTabbarController ()

@end

@implementation WJTabbarController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChileVC];
    [self observeBadgeValue];
}

- (void)observeBadgeValue
{
    @weakify(self);
    [RACObserve([WJUser currentUser], bageValue) subscribeNext:^(id x) {
        @strongify(self);
        UIViewController *vc3 = self.viewControllers[3];
        NSInteger num = [x integerValue];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (num > 0) {
                [vc3.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%ld",num]];
            }else {
                [vc3.tabBarItem setBadgeValue:nil];
            }
        });
    }];
}

- (void)addChileVC
{
    
    WJHomeVC *homeVC           = [[WJHomeVC alloc]initWithViewModel:[[WJHomeViewModel alloc]initWithService:nil params:@{@"title":@"首页"}]];
    WJNavaigationController *nav1 = [self setChildVC:homeVC title:@"首页" imageName:@"homeNormal" withSelectedName:@"homeHight"];
    
    
    WJCategoryVC *cateVC       = [[WJCategoryVC alloc]initWithViewModel:[[WJCategoryViewModel alloc]initWithService:nil params:@{@"title":@"分类"}]];
    WJNavaigationController *nav2 =  [self setChildVC:cateVC title:@"分类" imageName:@"categoryNormal" withSelectedName:@"categoryHight"];
    
    WJFoundVC *foundVC         = [[WJFoundVC alloc]initWithViewModel:[[WJFoundViewModel alloc]initWithService:nil params:@{@"title":@"发现"}]];
    WJNavaigationController *nav3 =   [self setChildVC:foundVC title:@"发现" imageName:@"foundNormal" withSelectedName:@"foundHight"];
    
    WJShoppingCarVC *shopVC    = [[WJShoppingCarVC alloc]initWithViewModel:[[WJShoppingCarViewModel alloc]initWithService:nil params:@{@"title":@"购物车"}]];
    
    WJNavaigationController *nav4 =  [self setChildVC:shopVC title:@"购物车" imageName:@"carNormal" withSelectedName:@"carHight"];
    
    WJMeVC *meVC               = [[WJMeVC alloc]initWithViewModel:[[WJMeViewModel alloc]initWithService:nil params:@{@"title":@"我的"}]];
    WJNavaigationController *nav5 =  [self setChildVC:meVC title:@"我的" imageName:@"meNoraml" withSelectedName:@"meHight"];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];


}

- (WJNavaigationController *)setChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imgName withSelectedName:(NSString *)selectedName
{
    vc.title                = title;
    vc.tabBarItem.image     = [UIImage imageNamed:imgName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedName];
    
    vc.tabBarController.tabBar.tintColor   = THEME_COLOR;
    
    NSDictionary *dic       = @{NSForegroundColorAttributeName:BLACK_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [vc.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NSDictionary *selectDic = @{NSForegroundColorAttributeName:THEME_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [vc.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    
    WJNavaigationController *nav = [[WJNavaigationController alloc]initWithRootViewController:vc];
    
    return nav;
}

@end
