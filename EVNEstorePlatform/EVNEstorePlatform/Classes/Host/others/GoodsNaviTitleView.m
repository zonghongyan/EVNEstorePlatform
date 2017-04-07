//
//  GoodsNaviTitleView.m
//  MMB_v3
//
//  Created by developer on 2017/3/12.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "GoodsNaviTitleView.h"
#import "UIView+Extension.h"
#import "HelpHeaderFile.h"

@implementation GoodsNaviTitleView

- (instancetype)initWithFrame:(CGRect)frame andWithBlock:(GoodsNaviTitleViewBlock)goodsNaviTitleViewBlock
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setShowsHorizontalScrollIndicator:NO]; // 设置是否显示水平滑竿
        [self setShowsVerticalScrollIndicator:NO];   // 设置是否显示垂直滑竿
        self.bounces = NO;
        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(frame.size.width, 88);
        self.scrollEnabled = NO; // 这里设置不可混动主要是用于上拉加载图文详情部分
        self.directionalLockEnabled = YES; // 定向锁定

        self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"商品", @"详情"]];
        self.segmentedControl.frame = CGRectMake(0, 0, self.frame.size.width, 41);
        self.segmentedControl.tintColor = [UIColor clearColor];

        // (未选中)状态下的文字颜色和字体
        [self.segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17], NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
        [self.segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateSelected];
         // 选中状态下的文字颜色和字体
        [self.segmentedControl addTarget:self action:@selector(sementedControlClick:) forControlEvents:UIControlEventValueChanged];

        [self addSubview:self.segmentedControl];

        self.segmentedControl.selectedSegmentIndex = 0;
        self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.segmentedControl.frame), 60, 2)];
        self.bottomView.centerX = self.segmentedControl.centerX * 0.5;
        self.bottomView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.bottomView];

        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, 44, frame.size.width, 44)];
        [titleLab setFont:[UIFont systemFontOfSize:18]];
        titleLab.text = @"图文详情";
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.textColor = [UIColor whiteColor];
        [self addSubview:titleLab];

        self.goodsNaviTitleViewBlock = goodsNaviTitleViewBlock;
    }
    return self;
}

- (void)sementedControlClick:(id)sender
{
    self.goodsNaviTitleViewBlock((self.segmentedControl.selectedSegmentIndex == 0)? 0: 1);
    [UIView animateWithDuration:0.25 animations:^{ // 修改底部线的frame值产生动画
        self.bottomView.centerX = (self.segmentedControl.selectedSegmentIndex == 0)? self.segmentedControl.centerX * 0.5 : self.segmentedControl.centerX * 1.5;
    }];
}

- (void)sementedControlClick
{
    [UIView animateWithDuration:0.25 animations:^{ // 修改底部线的frame值产生动画
        self.bottomView.centerX = (self.segmentedControl.selectedSegmentIndex == 0)? self.segmentedControl.centerX * 0.5 : self.segmentedControl.centerX * 1.5;
    }];
}

@end
