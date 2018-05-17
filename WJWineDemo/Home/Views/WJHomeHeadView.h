//
//  WJHomeHeadView.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJHomeHeadView : UICollectionReusableView
@property(nonatomic,strong)NSMutableArray   *dataArray;

@property(nonatomic,strong)RACSubject       *bannerSubject;

@property(nonatomic,strong)RACSubject       *btnSubject;

@end


@interface WJHomeBannerCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) UIImageView *imageView;

@end
