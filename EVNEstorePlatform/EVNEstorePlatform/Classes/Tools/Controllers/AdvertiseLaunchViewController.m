//
//  AdvertiseLaunchViewController.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/21.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "AdvertiseLaunchViewController.h"
#import "HelpHeaderFile.h"
#import "AppDelegate.h"
#import <UIImageView+WebCache.h>

@interface AdvertiseLaunchViewController ()
{
    UIView *view;
    AppDelegate *appDel;
}

@end

@implementation AdvertiseLaunchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadSubView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadSubView
{
    appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIImageView* imgview = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imgview.backgroundColor = [UIColor redColor];
    self.view = imgview;
    // TODO: 修改广告图
    NSString *imgUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"StartAdvertiseTag"]; // 加载广告图
    NSLog(@"%@",imgUrl);
    [imgview sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"RetinaImage.png"] options:SDWebImageHighPriority]; // 广告页而言，是优先下载，其次使用缓存

    UIButton *skipCurrentVCBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    skipCurrentVCBtn.frame = CGRectMake(MainScreenWidth - 88.f, 16, 66, 44);
    [skipCurrentVCBtn setTitle:@"跳过" forState:UIControlStateNormal];
    [skipCurrentVCBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [skipCurrentVCBtn addTarget:self action:@selector(goNextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:skipCurrentVCBtn];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self goNextVC];
    });
}

- (void) goNextVC
{
    [appDel dealEnterToDCFTabbar:@"首页"];
}


@end
