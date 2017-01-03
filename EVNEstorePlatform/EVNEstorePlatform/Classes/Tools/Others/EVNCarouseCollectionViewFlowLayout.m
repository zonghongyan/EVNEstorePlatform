//
//  EVNCarouseCollectionViewFlowLayout.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "EVNCarouseCollectionViewFlowLayout.h"

@implementation EVNCarouseCollectionViewFlowLayout

#pragma mark: 准备布局
- (void)prepareLayout
{
    [super prepareLayout];

    self.itemSize = self.collectionView.frame.size;     // 设置item尺寸

    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;     // 设置滚动方向
    self.collectionView.pagingEnabled = YES; // 设置分页
    self.minimumLineSpacing = 0; // 设置最小行间距
    self.minimumInteritemSpacing = 0; // 设置最小item间距
    self.collectionView.showsHorizontalScrollIndicator = NO; // 隐藏水平滚动条
}

@end
