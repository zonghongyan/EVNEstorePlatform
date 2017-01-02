//
//  BaseViewController.m
//  EVNEstorePlatform
//
//  Created by developer on 2016/12/30.
//  Copyright © 2016年 仁伯安. All rights reserved.
//

#import "BaseViewController.h"
#import "HelpHeaderFile.h"
#import "UIViewController+AddPushAndPopStyle.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self pushAndPopStyle];

    if([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }

    self.navigationController.navigationBar.tintColor = NaviColor; // 字体颜色
    self.navigationController.navigationBar.barTintColor = BACKGROUNDCOCOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
