//
//  WJHomeCollectionView.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJHomeViewModel.h"

@interface WJHomeCollectionView : UICollectionView

@property(nonatomic,strong)NSArray          *headArray;

@property(nonatomic,strong)NSMutableArray   *dataArray;

@property(nonatomic,strong)WJHomeViewModel *viewModel;

@end
