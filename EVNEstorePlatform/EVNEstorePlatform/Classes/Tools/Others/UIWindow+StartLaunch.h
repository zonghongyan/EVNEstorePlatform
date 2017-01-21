//
//  UIWindow+StartLaunch.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/21.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (StartLaunch)

/**
 普通设置根视图
 @param rootController 根视图
 */
- (void)startLaunchForRootController:(UIViewController *)rootController;

@end
