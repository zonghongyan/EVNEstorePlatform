//
//  HostHeadCollectionViewFlowLayout.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "HostHeadCollectionViewFlowLayout.h"

@implementation HostHeadCollectionViewFlowLayout

#pragma mark: 准备布局
- (void)prepareLayout
{
    [super prepareLayout];
    CGFloat itemWH = (self.collectionView.frame.size.width - 1) / 2; // 设置item尺寸
    self.itemSize = CGSizeMake(itemWH, itemWH + 20);

    self.scrollDirection = UICollectionViewScrollDirectionVertical; // 设置滚动方向
    self.minimumLineSpacing = 1;        // 设置最小行间距
    self.minimumInteritemSpacing = 1;   // 设置最小item间距
}

@end
