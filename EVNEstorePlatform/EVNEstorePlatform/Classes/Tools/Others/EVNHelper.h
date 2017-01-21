//
//  EVNHelper.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/2.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/************************************************************************
 * 作者: 仁伯安
 * 作者GitHub链接: https://github.com/zonghongyan
 * 作者简书链接：http://www.jianshu.com/users/ac49bc773ff9
 * 著作权归作者所有，转载请联系作者获得授权，并标注“作者”。
 ************************************************************************/


@interface EVNHelper : NSObject


/**
 #pragma mark - 从字符串中取出数字
 @param string string字符串
 @return 数字字符串
 */
+ (NSString *)getNumFromString:(NSString *) string;


/**
 #pragma mark - 判断字符串是否为空
 @param string string字符串
 @return 是否为存在YES表示不为空，NO为空
 */
+ (BOOL)validateString:(NSString *)string;

/**
 #pragma mark - 传入颜色和SIZE返回图片
 @param color color
 @param size imageSize
 @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 #pragma mark - 缩放图片
 @param image image
 @param reSize 重置的size
 @return UIImage
 */
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

/**
 #pragma mark - 高度或宽度自适应
 @param font 字体大小
 @param string 传入的字符串
 @param size 自适应的大小，一般确定宽度或者确定高度
 @return CGFloat 对应的大小
 */
+ (CGFloat)adjustWithFont:(UIFont *)font WithString:(NSString *)string WithSize:(CGSize)size;

/**
 #pragma mark - 高度或宽度自适应
 @param font 字体大小
 @param string 传入字符串
 @param size 自适应的大小，一般确定宽度或者确定高度
 @return CGSize 对应大小
 */
+ (CGSize)adjustWithFont:(UIFont*)font WithText:(NSString *)string WithSize:(CGSize)size;

/**
 #pragma mark - 十六进制颜色值
 @param color 十六进制颜色值
 @param alpha 透明度
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end


