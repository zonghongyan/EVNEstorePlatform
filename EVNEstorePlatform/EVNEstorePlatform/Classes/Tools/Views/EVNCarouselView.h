//
//  EVNCarouselView.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVNCarouselView : UIView<UICollectionViewDelegate, UICollectionViewDataSource>

- (instancetype)initWithImageArray:(NSArray *)imageArray;

@end
