//
//  WelComeViewController.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/21.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "WelComeViewController.h"
#import "EVNTabBarController.h"
#import "HelpHeaderFile.h"
#import "AppDelegate.h"

@interface WelComeViewController ()
{
    NSMutableArray *imageViewArray;    //图片数组
    EVNTabBarController *tabbar;
    UINavigationController *dcfRoot;
    AppDelegate *appDel;

    UIView *jumpView;

    UIButton *jumpBtn;
}

@end

@implementation WelComeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;

    [self.navigationController setNavigationBarHidden:YES];

    imageViewArray = [[NSMutableArray alloc] init];

    _pageControl = [[UIPageControl alloc] init];
    [_pageControl setFrame:CGRectMake(0, MainScreenHeight - 45, self.view.bounds.size.width, 30)];
    _pageControl.pageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pageCircle_unchoose"]];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:99.0/255.0 green:180.0/255.0 blue:249.0/255.0 alpha:1.0];
    [_pageControl setNumberOfPages:3];
    [_pageControl setCurrentPage:0];
    [self.view addSubview:_pageControl];

    [self.sv setDelegate:self];
    self.sv.showsHorizontalScrollIndicator = NO;
    self.sv.showsVerticalScrollIndicator = NO;
    [self.sv setContentSize:CGSizeMake(MainScreenWidth*3, MainScreenHeight)];


    UIImage *image_1 = [UIImage imageNamed:@"RetinaImage"]; // 加载图片
    [self.iv_Fir setImage:image_1];

    UIImage *image_2 = [UIImage imageNamed:@"RetinaImage"];
    [self.iv_Sec setImage:image_2];

    UIImage *image_3 = [UIImage imageNamed:@"RetinaImage"];
    [self.iv_Third setImage:image_3];


    jumpView = [[UIView alloc] initWithFrame:CGRectMake(0, MainScreenHeight-50, MainScreenWidth, 50)];
    jumpView.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
    jumpView.hidden = YES;
    [self.view insertSubview:jumpView aboveSubview:_backView];

    UIView *jumpLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 0.3)];
    jumpLineView.backgroundColor = NaviColor;
    [jumpView addSubview:jumpLineView];

    jumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [jumpBtn setBackgroundColor:[UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0]];
    jumpBtn.frame = CGRectMake(0, jumpLineView.frame.origin.y + jumpLineView.frame.size.height, MainScreenWidth, jumpView.frame.size.height - jumpLineView.frame.size.height);
    [jumpBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [jumpBtn setTitleColor:NaviColor forState:UIControlStateNormal];
    [jumpBtn.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [jumpBtn addTarget:self action:@selector(jumpBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [jumpView addSubview:jumpBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) jumpToHostView
{
    dispatch_async(dispatch_get_main_queue(), ^(void){

        [appDel dealEnterToDCFTabbar:@"tokenView"];
    });
}

- (void) starButtonClick:(UIButton *) sender
{
    //跳转到主页
    [self jumpToHostView];

    //    [self.navigationController pushViewController:tabbar animated:YES];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.view.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1;
    self.pageControl.currentPage = page;
    if(page == 2)
    {
        jumpView.hidden = NO;
    }
    else
    {
        jumpView.hidden = YES;
    }
    _pageControl.hidden = !jumpView.hidden;
}

- (void) jumpBtnClick:(id)sender
{
    [self jumpToHostView];
}

@end
