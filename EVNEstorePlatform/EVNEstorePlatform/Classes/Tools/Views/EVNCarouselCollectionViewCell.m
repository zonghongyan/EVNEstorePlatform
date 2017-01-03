//
//  EVNCarouselCollectionViewCell.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "EVNCarouselCollectionViewCell.h"

@interface EVNCarouselCollectionViewCell()

@property (nonatomic, weak) UIImageView *iconView;

@end

@implementation EVNCarouselCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
    }
    return self;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.iconView.image = [UIImage imageNamed:imageName];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconView.frame = self.bounds;
}



@end
