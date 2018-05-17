//
//  WJMacro.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#ifndef WJMacro_h
#define WJMacro_h


#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
///读取用户数据完成a
#define READ_USER_DATA_FINISH @"readUserDataFinish"
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]

#define CURRENT_USER [WJUser currentUser]

#define SHOPPING_MANAGER [WJShoppingManager manager]

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define WTKLog(fmt, ...) NSLog((@"\n[文件名:%s]\n""[函数名:%s]""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(...) {}
#define WTKLog(...);
#endif

#pragma mark - 宽高

#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width
#define ZOOM_SCALL kWidth/375.0

#define IMG_URL @"http://www.jiuyunda.net:90"


//首页轮播图
#define HOME_HEAD @"HomeHead"
//首页热门商品
#define Home_Data @"HomeData"

#endif /* WJMacro_h */
