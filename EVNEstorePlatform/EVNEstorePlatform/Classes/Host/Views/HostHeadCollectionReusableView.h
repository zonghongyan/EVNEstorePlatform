//
//  HostHeadCollectionReusableView.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EVNCarouselView.h"

@protocol HostHeadCollectionReusableViewDelegete <NSObject>

/**
 * carouselView
 * @param indexItem index item
 */
- (void)hostHeadCollectionCarouselViewEventDidSelectIndex:(NSInteger)indexItem;

/**
 * hostHeadCollection
 * @param indexItem index item
 */
- (void)hostHeadCollectionEventDidSelectIndex:(NSInteger)indexItem;

@end

@interface HostHeadCollectionReusableView : UICollectionReusableView<UICollectionViewDelegate, UICollectionViewDataSource, EVNCarouselViewDelegete>

@property (nonatomic, weak) id<HostHeadCollectionReusableViewDelegete>hostHeadCollectionReusableViewDelegete;

@end
