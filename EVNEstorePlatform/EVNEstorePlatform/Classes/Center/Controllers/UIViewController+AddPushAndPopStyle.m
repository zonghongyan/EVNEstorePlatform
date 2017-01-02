//
//  UIViewController+AddPushAndPopStyle.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/2.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "UIViewController+AddPushAndPopStyle.h"
#import "HelpHeaderFile.h"

@implementation UIViewController (AddPushAndPopStyle)

- (void) pushAndPopStyle
{
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(popViewControllerAnimated:)];

    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];

    [self.navigationController.navigationBar setTintColor:NaviColor];

    self.navigationItem.backBarButtonItem = backBarButtonItem;
}

- (void)popViewControllerAnimated:(UIBarButtonItem *) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
