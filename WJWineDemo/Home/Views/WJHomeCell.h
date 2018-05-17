//
//  WJHomeCell.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJHomeCell : UICollectionViewCell
///是否为搜索界面的cell(标志是否做动画)
@property(nonatomic,assign)BOOL isSearch;

- (void)updateGood:(WJGood *)goods;
@end
