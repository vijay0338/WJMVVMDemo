//
//  WJCategoryRightTableView.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/9.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJCategoryViewModel;
@interface WJCategoryRightTableView : UITableView
@property(nonatomic,strong)NSArray                  *sectionArray;

@property(nonatomic,strong)NSDictionary             *dataDic;

@property(nonatomic,strong)WJCategoryViewModel     *viewModel;
@end
