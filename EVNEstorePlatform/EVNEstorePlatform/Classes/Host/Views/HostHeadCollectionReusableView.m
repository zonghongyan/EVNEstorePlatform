//
//  HostHeadCollectionReusableView.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "HostHeadCollectionReusableView.h"

#import "HelpHeaderFile.h"
#import "HostHeaderCollectionViewCell.h"
#import "EVNCarouselView.h"
#import "HostHeaderCollectionViewCellFlowLayout.h"

static NSString *ID = @"hostHeaderCollectionViewCell";

@interface HostHeadCollectionReusableView()

@property (nonatomic, strong) NSMutableArray *buttonIconMutableArray;

@end

@implementation HostHeadCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 添加图片轮播器
        CGFloat loopViewH = 200;
        NSArray *imageArray = @[@"pic.png", @"lunbo2.png", @"lunbo3.png", @"pic.png", @"lunbo2.png"];
        EVNCarouselView *loopView = [[EVNCarouselView alloc] initWithImageArray:imageArray];
        loopView.frame = CGRectMake(0, 0, MainScreenWidth, loopViewH);
        [self addSubview:loopView];

        CGFloat collectionViewY = loopViewH;            // 添加横向滑动的UICollectionView
        CGFloat collectionViewH = MainScreenWidth / 2;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, collectionViewY, MainScreenWidth, collectionViewH) collectionViewLayout:[[HostHeaderCollectionViewCellFlowLayout alloc] init]];
        [collectionView registerClass:[HostHeaderCollectionViewCell class] forCellWithReuseIdentifier:ID];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [self addSubview:collectionView];

        self.buttonIconMutableArray = [[NSMutableArray alloc] init];

        for (int i = 1; i < 7; i ++) // 横向滑动菜单按钮图片名字
        {
            NSString *name = [NSString stringWithFormat:@"hostModel%d",i];
            [self.buttonIconMutableArray addObject:name];
        }
    }
    return self;
}

#pragma mark UICollectionViewDataSource 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HostHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.imageName = self.buttonIconMutableArray[indexPath.item % (self.buttonIconMutableArray.count - 1)];
    switch (indexPath.item)
    {
        case 0:
            cell.title = @"在线客服";
            break;
        case 1:
            cell.title = @"场合选择";
            break;
        case 2:
            cell.title = @"家装线专卖";
            break;
        case 3:
            cell.title = @"快速查询";
            break;
        case 4:
            cell.title = @"热门分类";
            break;
        case 5:
            cell.title = @"热门型号";
            break;
        case 6:
            cell.title = @"电缆选购";
            break;
        case 7:
            cell.title = @"电话服务";
            break;
        default:
            break;
    }
    
    return cell;
}


@end
