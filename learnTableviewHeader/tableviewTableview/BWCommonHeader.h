//
//  BWCommonHeader.h
//  learnTableviewHeader
//
//  Created by bowen.liu on 15/12/23.
//  Copyright © 2015年 easyDevice. All rights reserved.
//

#ifndef BWCommonHeader_h
#define BWCommonHeader_h

#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define NavigationBar_HEIGHT 44
#define Statue_HEIGHT 20

#define TOTLEHEIGHT 64
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#endif /* BWCommonHeader_h */
