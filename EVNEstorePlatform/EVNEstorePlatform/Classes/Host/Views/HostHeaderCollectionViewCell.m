//
//  HostHeaderCollectionViewCell.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "HostHeaderCollectionViewCell.h"

@interface HostHeaderCollectionViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HostHeaderCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:12.0];
        titleLabel.textColor = [UIColor grayColor];
        [self addSubview:titleLabel];
        self.iconView = iconView;
        self.titleLabel = titleLabel;
    }
    return self;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.iconView.image = [UIImage imageNamed:imageName];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconView.frame = CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40);
    self.titleLabel.frame = CGRectMake(0, 75, self.frame.size.width, 21);
}


@end
