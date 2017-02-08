//
//  GetTokenFailViewController.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/21.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "GetTokenFailViewController.h"
#import "EVNHUD.h"
#import "AppDelegate.h"

@interface GetTokenFailViewController ()
{
    AppDelegate *appDel;
}

@end

@implementation GetTokenFailViewController

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [EVNHUD showLoadingHUDWithText:nil inView:self.view];; // 只显示图片加载
    [self verification];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    self.view.alpha = 0.5;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];

    [EVNHUD hideHUD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)verification
{
    // 这个地方一般需要一个接口
//    if 需要广告页
    NSString *imgUrl = @"http://upload-images.jianshu.io/upload_images/949086-ccf562d6183c66ce.png";
//    NSString *imgUrl = @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg";
    [[NSUserDefaults standardUserDefaults] setObject:imgUrl forKey:@"StartAdvertiseTag"];
    [self goNextVC:@"广告页"];
//    else
//    [self goNextVC:@"首页"];
}

- (void) goNextVC:(NSString *)viewControllerName
{
    CATransition *transaction = [CATransition animation];
    transaction.duration = 0.8f;
    transaction.type = kCATransitionFade;
    [self.view.layer addAnimation:transaction forKey:nil];
    [appDel dealEnterToDCFTabbar:viewControllerName];
}


@end
