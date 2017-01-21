//
//  EVNHUD.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/21.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

/********************************************* 本类使用说明 ******************************************
 *
 * [EVNHUD showLoadingHUD]; // 只显示图片加载
 * [EVNHUD showLoadingHUDWithText:@"加载中..."]; // 加载提示信息和图片，模态方式
 *
 * [EVNHUD showLoadingHUDWithText:nil inView:self.view]; // 加载提示信息和图片到本视图中，实际是非模态方式
 * [EVNHUD hideHUD]; // 加载成功后，隐藏掉HUD
 *
 ***************************************************************************************************/

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface EVNHUD : NSObject

/**
 *  隐藏EVNHUD
 */
+ (void)hideHUD;

/**
 *  显示EVNHUD 只有图片
 */
+ (void)showLoadingHUD;

/**
 *  显示EVNHUD（图片+文字）模态
 */
+ (void)showLoadingHUDWithText:(NSString *)text;

/**
 *  显示EVNHUD（图片+文字）这个地方非模态
 */
+ (void)showLoadingHUDWithText:(NSString *)text inView:(UIView *)containerView;

/**
 *  单例销毁
 */
+ (void)attemptDealloc;

@end

/************************************************************************
 * 作者: 仁伯安
 * 作者GitHub链接: https://github.com/zonghongyan
 * 作者简书链接：http://www.jianshu.com/users/ac49bc773ff9
 * 著作权归作者所有，转载请联系作者获得授权，并标注“作者”。
 ************************************************************************/
