//
//  EVNNavigationController.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/2.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "EVNNavigationController.h"
#import "HelpHeaderFile.h"
#import "EVNHelper.h"

@interface EVNNavigationController ()

@end

@implementation EVNNavigationController

+ (void)load
{
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil ];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    dic[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    dic[NSForegroundColorAttributeName] = UIColorFromRGB(0x252729);
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];

    // appearanceWhenContainedInInstancesOfClasses的含义就是让UINavigationBar在EVNNavigationController表现为某种特性
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    NSMutableDictionary *dicBar = [NSMutableDictionary dictionary];

    dicBar[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:dic];

//    [[UITextField appearance] setTintColor:[UIColor blackColor]];       // 这样设置会改变所有的textfield的光标

//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];   // 设置返回按钮颜色
//
//    [navBar setBarTintColor:NaviColor];                                 // 设置导航条背景颜色
    // [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];

//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil]; // 去掉返回的标题
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    return [super pushViewController:viewController animated:animated];
}


@end
