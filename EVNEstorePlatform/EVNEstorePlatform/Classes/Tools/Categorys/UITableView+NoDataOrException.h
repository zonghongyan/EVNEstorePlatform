//
//  UITableView+NoDataOrException.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/2/9.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (NoDataOrException)

/**
 * 网络异常及无数据展示图
 * @param displayView 要展示的视图
 * @param rowCount 0
 */
- (void)tableViewDisplayView:(UIView *)displayView andWithRowCount:(NSUInteger)rowCount;

@end
/************************************************************************
 * 作者: 仁伯安
 * 作者GitHub链接: https://github.com/zonghongyan
 * 作者简书链接：http://www.jianshu.com/users/ac49bc773ff9
 * 著作权归作者所有，转载请联系作者获得授权，并标注“作者”。
 ************************************************************************/
