//
//  EVNPopView.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/2.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

/************************************************************************
 * 作者: 仁伯安
 * 作者GitHub链接: https://github.com/zonghongyan
 * 作者简书链接：http://www.jianshu.com/users/ac49bc773ff9
 * 著作权归作者所有，转载请联系作者获得授权，并标注“作者”。
 ************************************************************************/


#import <UIKit/UIKit.h>

/**
 * 将要回调，动画部分用到
 */
typedef void (^EVNPopViewWillCloseBlock)();

/**
 * 已经关闭回调，动画部分用到
 */
typedef void (^EVNPopViewDidCloseBlock)();

@interface EVNPopView : UIView

@property (copy, nonatomic) EVNPopViewWillCloseBlock semiModalViewWillCloseBlock;

@property (copy, nonatomic) EVNPopViewDidCloseBlock semiModalViewDidCloseBlock;

/**
 * 弹出的可见视图
 */
@property (strong, nonatomic) UIView *contentView;

/**
 * narrowedOff为YES时，背景整个覆盖，只是弹出效果，类似京东和淘宝的地址选择弹出，商品属性选择的，不设置即narrowedOff为NO
 */
@property (assign, nonatomic) BOOL narrowedOff;

/**
 * 类初始化方法
 @param size 弹出视图的大小
 @param baseViewController 父视图控制器
 @return EVNPopView实例
 */
- (instancetype)initWithSize:(CGSize)size andBaseViewController:(UIViewController *)baseViewController;

/**
 * 关闭视图
 */
- (void)popViewClose;


/**
 * 弹出视图
 */
- (void)popViewOpen;

@end

/*********************************************** 使 用 说 明 ***********************************************/
/********* 每次弹出都重新初始化EVNPopView，对于简单的不需要，可以修改该类的popViewClose方法152行左右，伯安多次测试结果看，不建议，还是老老实实初始化吧。
 * 1. EVNPopView *popView = [[EVNPopView alloc] initWithSize:CGSizeMake(MainScreenWidth, MainScreenHeight - 210*ScreenScaleX) andBaseViewController:self];
 * 2. 初始化，弹出的视图，比如：_view = [UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, self.narrowedModalView.mj_h)];
 * 3. 设置弹出页面效果，popView.narrowedOff = YES; // 类似京东淘宝地址的不写这一行
 * 4. 将2中的视图添加到EVNPopView的子视图中去，[popView.contentView addSubview:_view];
 * 5. 弹出EVNPopView子视图: [popView open];
 * 6. 默认单击阴影部分是可以关闭的，如果需要在2中的视图中写事件关闭EVNPopView主动关闭:[popView open];
 */

