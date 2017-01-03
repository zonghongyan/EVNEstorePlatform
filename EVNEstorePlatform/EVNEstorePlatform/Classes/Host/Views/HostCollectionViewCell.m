//
//  HostCollectionViewCell.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "HostCollectionViewCell.h"

@interface HostCollectionViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *describeLabel;
@property (nonatomic, strong) UILabel *originalPriceLabel;
@property (nonatomic, strong) UILabel *currentPriceLabel;
@property (nonatomic, strong) UIView *line;

@end

@implementation HostCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];

        UILabel *describeLabel = [[UILabel alloc] init];
        describeLabel.font = [UIFont systemFontOfSize:12.0];
        describeLabel.textColor = [UIColor grayColor];
        [self addSubview:describeLabel];

        UILabel *currentPriceLabel = [[UILabel alloc] init];
        currentPriceLabel.font = [UIFont systemFontOfSize:12.0];
        currentPriceLabel.textColor = [UIColor redColor];
        [self addSubview:currentPriceLabel];

        UILabel *originalPriceLabel = [[UILabel alloc] init];
        originalPriceLabel.font = [UIFont systemFontOfSize:10.0];
        originalPriceLabel.textColor = [UIColor grayColor];
        [self addSubview:originalPriceLabel];

        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor grayColor];
        [self addSubview:line];

        self.iconView = iconView;
        self.describeLabel = describeLabel;
        self.currentPriceLabel = currentPriceLabel;
        self.originalPriceLabel = originalPriceLabel;
        self.line = line;
    }
    return self;
}

- (void)setIconName:(NSString *)iconName
{
    _iconName = iconName;
    self.iconView.image = [UIImage imageNamed:iconName];
}

- (void)setDescribe:(NSString *)describe
{
    _describe = describe;
    self.describeLabel.text = describe;
}

- (void)setCurrentPrice:(NSString *)currentPrice
{
    _currentPrice = currentPrice;
    self.currentPriceLabel.text = currentPrice;
}

- (void)setOriginalPrice:(NSString *)originalPrice
{
    _originalPrice = originalPrice;
    self.originalPriceLabel.text = originalPrice;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat iconViewH = self.frame.size.height - 80;
    CGFloat labelY = iconViewH + 40;
    self.iconView.frame = CGRectMake(40, 40, self.frame.size.width - 80, iconViewH);
    self.describeLabel.frame = CGRectMake(10, labelY, self.frame.size.width, 21);
    self.currentPriceLabel.frame = CGRectMake(10, labelY + 21, 30, 21);
    self.originalPriceLabel.frame = CGRectMake(45, labelY + 23, 30, 21);
    self.line.frame = CGRectMake(42, labelY + 23 + 10.5, 33, 1);
}


@end

