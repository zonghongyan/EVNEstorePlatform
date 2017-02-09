//
//  UITableView+NoDataOrException.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/2/9.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "UITableView+NoDataOrException.h"

@implementation UITableView (NoDataOrException)

- (void)tableViewDisplayView:(UIView *)displayView andWithRowCount:(NSUInteger)rowCount
{
    if (rowCount == 0)
    {
        self.backgroundView = displayView;
        self.scrollEnabled = NO;
        //        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    else
    {
        self.backgroundView = nil;
        //        self.scrollEnabled = YES;
        //        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

@end
