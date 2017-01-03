//
//  HostCollectionViewCell.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HostCollectionViewCell : UICollectionViewCell

/**
 * 商品图片名字
 */
@property (nonatomic, copy) NSString *iconName;

/**
 * 商品描述
 */
@property (nonatomic, copy) NSString *describe;

/**
 * 原价
 */
@property (nonatomic, copy) NSString *originalPrice;

/**
 * 现价
 */
@property (nonatomic, copy) NSString *currentPrice;

@end
