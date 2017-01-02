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
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    dic[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];

    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [navBar setBackgroundImage:[EVNHelper imageWithColor:NaviColor size:CGSizeMake(MainScreenWidth, 64)] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *dicBar = [NSMutableDictionary dictionary];

    dicBar[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [navBar setTitleTextAttributes:dic];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

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
