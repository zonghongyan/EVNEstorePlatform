//
//  EVNHelper.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/2.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EVNHelper : NSObject


/**
 #pragma mark - 传入颜色和SIZE返回图片
 @param color color
 @param size imageSize
 @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

/************************************************************************
 * 作者: 仁伯安
 * 作者GitHub链接: https://github.com/zonghongyan
 * 作者简书链接：http://www.jianshu.com/users/ac49bc773ff9/latest_articles
 * 著作权归作者所有，转载请联系作者获得授权，并标注“作者”。
 ************************************************************************/
