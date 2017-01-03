//
//  HostHeaderCollectionViewCellFlowLayout.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "HostHeaderCollectionViewCellFlowLayout.h"

@implementation HostHeaderCollectionViewCellFlowLayout

#pragma mark: 准备布局
- (void)prepareLayout
{
    [super prepareLayout];

    CGFloat itemWH = self.collectionView.frame.size.width / 4; // 设置item尺寸
    self.itemSize = CGSizeMake(itemWH, itemWH);

    self.scrollDirection = UICollectionViewScrollDirectionHorizontal; // 设置滚动方向
    self.collectionView.pagingEnabled = YES;    // 设置分页
    self.minimumLineSpacing = 0;                // 设置最小行间距
    self.minimumInteritemSpacing = 0;           // 设置最小item间距
}


@end
