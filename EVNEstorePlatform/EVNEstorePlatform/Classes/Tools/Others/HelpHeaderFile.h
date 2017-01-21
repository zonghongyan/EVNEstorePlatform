//
//  HelpHeaderFile.h
//  EVNEstorePlatform
//
//  Created by developer on 2016/12/30.
//  Copyright © 2016年 仁伯安. All rights reserved.
//

////////////////////////////////////////////////////////////////////
//                          _ooOoo_                               //
//                         o8888888o                              //
//                         88" . "88                              //
//                         (| ^_^ |)                              //
//                         O\  =  /O                              //
//                      ____/`---'\____                           //
//                    .'  \\|     |//  `.                         //
//                   /  \\|||  :  |||//  \                        //
//                  /  _||||| -:- |||||-  \                       //
//                  |   | \\\  -  /// |   |                       //
//                  | \_|  ''\---/''  |   |                       //
//                  \  .-\__  `-`  ___/-. /                       //
//                ___`. .'  /--.--\  `. . ___                     //
//              ."" '<  `.__\_<|>_/___.'  >'"".                   //
//            | | :  `- \`.;`\ _ /`;.`/ - ` : | |                 //
//            \  \ `-.   \_ __\ /__ _/   .-` /  /                 //
//     ========`-.____`-.___\_____/___.-`____.-'========          //
//                          `=---='                               //
//      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        //
//                   佛祖保佑            永无BUG                    //
////////////////////////////////////////////////////////////////////

#ifndef HelpHeaderFile_h
#define HelpHeaderFile_h

/**
 // MARK: 屏幕适配宏
 */
#define MainScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define MainScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenScaleX ([UIScreen mainScreen].bounds.size.width/320.0)
#define ScreenScaleY ([UIScreen mainScreen].bounds.size.height/480.0)


#define SYSTEM_VERSION   [[UIDevice currentDevice].systemVersion floatValue]


// MARK: 颜色设置方法 && 统一控件颜色
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define TextColor RGBACOLOR(93, 95, 106, 1.0)
#define TabBarTextGColor RGBACOLOR(255, 86, 88, 1)

#define NaviColor UIColorFromRGB(0x252729)

#define TabBarSelectColor UIColorFromRGB(0x252729)
#define TabBarUnSelectColor UIColorFromRGB(0x252729)

#define BUTTONCOLOR ([UIColor colorWithRed:82.0/255.0 green:157.0/255.0 blue:219.0/255.0 alpha:1.0]) // 浅蓝色


#define BACKGROUNDCOCOR  ([UIColor colorWithRed:242.f/255.0 green:243.f/255.0 blue:245.0f/255.0 alpha:1.0])
#define LINECOCOR ([UIColor colorWithRed:221.0f/255.0 green:222.0f/255.0 blue:223.0f/255.0 alpha:1.0])

/*
 // MARK: 定义线条的粗细和角度
 */
#define LineWidth .41f
#define LineCorner 4.0f
#define LineBorder 1.f


/*
 // MARK: 读取本地图片, 前两种宏性能高，省内存
 */
#define IMAGECONTENTSOFFILE(imageFile, fileType) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageFile ofType:fileType]]
#define IMAGE(imageFile) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageFile ofType:nil]] //定义UIImage对象
#define ImageNamed(imageFile) [UIImage imageNamed:[UIImage imageName:imageFile]] //定义UIImage对象

#pragma mark - 版权符号©


#endif /* HelpHeaderFile_h */


/************************************************************************
 * 作者: 仁伯安
 * 作者GitHub链接: https://github.com/zonghongyan
 * 作者简书链接：http://www.jianshu.com/users/ac49bc773ff9
 * 著作权归作者所有，转载请联系作者获得授权，并标注“作者”。
 ************************************************************************/
