//
//  EVNCarouselView.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EVNCarouselViewDelegete <NSObject>


/**
 * selected item
 * @param indexItem index item
 */
- (void)carouselViewDidSelectItem:(NSInteger )indexItem;

@end

@interface EVNCarouselView : UIView<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) id<EVNCarouselViewDelegete>carouselViewDelegete;

- (instancetype)initWithImageArray:(NSArray *)imageArray;


@end
