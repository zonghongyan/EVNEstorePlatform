//
//  EVNTabBarController.m
//  EVNEstorePlatform
//
//  Created by developer on 2016/12/30.
//  Copyright © 2016年 仁伯安. All rights reserved.
//

#import "EVNTabBarController.h"
#import "HelpHeaderFile.h"

@interface EVNTabBarController ()

@end

@implementation EVNTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCutomBar];

//    UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 2)];
////    lineView.backgroundColor = TabBarColor;
//    [self.tabBar addSubview:lineView];
//    lineView.image = [UIImage imageNamed:@"tapbar_top_line"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tapbar_top_line"]]; // tab_background

    // 设置tabbar背景颜色
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]]; // 设置tabbar背景颜色
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]]; // 设置tabbar背景颜色
    [[UITabBar appearance] setTintColor:UIColorFromRGB(0xe9a658)]; // 选中状态时候的字体颜色及背景
    // 如果需要自定义图片就需要设置以下几行
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : TabBarUnSelectColor} forState:UIControlStateNormal]; // UITabBarItem未选中状态的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColorFromRGB(0xe9a658)} forState:UIControlStateSelected]; // UITabBarItem选中状态的颜色

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initCutomBar
{

//    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;

#pragma mark: 首页storyboard
    UIImage *hostSelectImg = [UIImage imageNamed:@"hostViewSelect"];
    UIImage *hostUnSelectImg = [UIImage imageNamed:@"hostViewUnSelect"];
    UIStoryboard *hostSB = [UIStoryboard storyboardWithName:@"Host" bundle:nil];
    UINavigationController *hostNaviVC = [hostSB instantiateViewControllerWithIdentifier:@"hostNavigationC"];
    hostNaviVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[self scaleImage:hostUnSelectImg] selectedImage:[self scaleImage:hostSelectImg]];
    hostNaviVC.tabBarItem.tag = 0;


#pragma mark: 关注storyboard
    UIImage *attentionSelectImg = [UIImage imageNamed:@"attentionSelect.png"];
    UIImage *attentionUnSelectImg = [UIImage imageNamed:@"attentionUnSelect.png"];
    UIStoryboard *attentionSB = [UIStoryboard storyboardWithName:@"Attention" bundle:nil];
    UINavigationController *attentionNaviVC = [attentionSB instantiateViewControllerWithIdentifier:@"attentionNavigationC"];
    attentionNaviVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"关注" image:[self scaleImage:attentionUnSelectImg] selectedImage:[self scaleImage:attentionSelectImg]];
    attentionNaviVC.tabBarItem.tag = 1;

#pragma mark: 发现storyboard

    UIImage *findSelectImg = [UIImage imageNamed:@"findSelect.png"];
    UIImage *findUnSelectImImg = [UIImage imageNamed:@"findUnSelect.png"];
    UIStoryboard *findSB = [UIStoryboard storyboardWithName:@"Find" bundle:nil];
    UINavigationController *findNaviVC = [findSB instantiateViewControllerWithIdentifier:@"findNavigationC"];
    findNaviVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageWithCGImage:findUnSelectImImg.CGImage scale:1.5 orientation:findUnSelectImImg.imageOrientation] selectedImage:[UIImage imageWithCGImage:findSelectImg.CGImage scale:1.5 orientation:findSelectImg.imageOrientation]];

    [findNaviVC.tabBarItem setImageInsets:UIEdgeInsetsMake(-14, 0, 14, 0)];
    findNaviVC.tabBarItem.tag = 2;

    findNaviVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"findSelect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    findNaviVC.tabBarItem.image = [[UIImage imageNamed:@"findUnSelect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

#pragma mark: 购物车storyboard
    UIImage *goodsCarSelectImg = [UIImage imageNamed:@"goodsCarSelect.png"];
    UIImage *goodsCarUnSelectImg = [UIImage imageNamed:@"goodsCarUnSelect.png"];
    UIStoryboard *goodsCarSB = [UIStoryboard storyboardWithName:@"GoodsCar" bundle:nil];
    UINavigationController *goodsCarNaviVC = [goodsCarSB instantiateViewControllerWithIdentifier:@"goodsCarNavigationC"];
    goodsCarNaviVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购物车" image:[self scaleImage:goodsCarUnSelectImg] selectedImage:[self scaleImage:goodsCarSelectImg]];
    goodsCarNaviVC.tabBarItem.tag = 3;

#pragma mark: 个人中心storyboard
    UIImage *mineCenterSelectImg = [UIImage imageNamed:@"mineCenterSelect.png"];
    UIImage *mineCenterUnSelectImg = [UIImage imageNamed:@"mineCenterUnSelect.png"];
    UIStoryboard *mineCenterSB = [UIStoryboard storyboardWithName:@"MineCenter" bundle:nil];
    UINavigationController *mineCenterNaviVC = [mineCenterSB instantiateViewControllerWithIdentifier:@"mineCenterNavigationC"];
    mineCenterNaviVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[self scaleImage:mineCenterUnSelectImg] selectedImage:[self scaleImage:mineCenterSelectImg]];
    mineCenterNaviVC.tabBarItem.tag = 4;

    self.viewControllers = @[hostNaviVC, attentionNaviVC, findNaviVC, goodsCarNaviVC, mineCenterNaviVC];
}

- (UIImage *)scaleImage:(UIImage *)image
{
    return [UIImage imageWithCGImage:image.CGImage scale:1.5 orientation:image.imageOrientation];
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
- (NSUInteger)supportedInterfaceOrientations
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
#endif
{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - tabbar的代理方法，
#pragma mark: 每次单击item的时候，如果需要切换则返回yes，否则no
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

#pragma mark: 只要上面的shouldSelectViewController返回yes，下一步就执行该方法，下面为了单击在线咨询item，跳转至客服页面
- (void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    //    int index = (int)tabBarController.selectedIndex;
}


@end
