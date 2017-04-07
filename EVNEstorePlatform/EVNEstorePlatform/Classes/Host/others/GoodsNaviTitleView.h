//
//  GoodsNaviTitleView.h
//  MMB_v3
//
//  Created by developer on 2017/3/12.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GoodsNaviTitleViewBlock)(int pageIndex);

/**
 * 商品详情顶部 滑动的东西
 */
@interface GoodsNaviTitleView : UIScrollView

@property (strong, nonatomic) UISegmentedControl *segmentedControl;
// 底部线
@property (strong, nonatomic) UIView *bottomView;

@property (copy, nonatomic) GoodsNaviTitleViewBlock goodsNaviTitleViewBlock;

- (instancetype)initWithFrame:(CGRect)frame andWithBlock:(GoodsNaviTitleViewBlock)goodsNaviTitleViewBlock;

/**
 * 监听方法
 */
- (void)sementedControlClick;

@end
