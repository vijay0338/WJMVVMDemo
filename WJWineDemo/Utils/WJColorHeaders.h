//
//  WJColorHeaders.h
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#ifndef WJColorHeaders_h
#define WJColorHeaders_h

#define WJCOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define BASE_COLOR WJCOLOR(243, 243, 246, 1.0)

#define BACK_COLOR WJCOLOR(240,240,240,1)


#define BASE_COLOR1 WJCOLOR(210, 210, 210, 1.0)

#define THEME_COLOR WJCOLOR(250, 98, 97, 1)

#define THEME_COLOR_ALPHA WJCOLOR(250, 98, 97, 0.99)

#define BLACK_COLOR WJCOLOR(50,50,50,1)

#define WORDS_COLOR [UIColor colorWithHex:0x5c5c5c] // 常规文字

#define LINKS_COLOR [UIColor colorWithHex:0x333333] // 链接 (深绿)

#define LINE_COLOR [UIColor colorWithHex:0xe9e9e9]  // 描线色

#endif /* WJColorHeaders_h */
