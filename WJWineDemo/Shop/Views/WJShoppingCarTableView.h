//
//  WJShoppingCarTableView.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/9.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJShoppingCarViewModel;
@interface WJShoppingCarTableView : UITableView
@property(nonatomic,strong)NSArray                  *dataArray;

@property(nonatomic,strong)WJShoppingCarViewModel  *viewModel;


- (void)w_reloadData;
@end
