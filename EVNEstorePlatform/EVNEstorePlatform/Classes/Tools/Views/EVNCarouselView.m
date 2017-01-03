//
//  EVNCarouselView.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/3.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "EVNCarouselView.h"

#import "EVNCarouselCollectionViewCell.h"
#import "EVNCarouseCollectionViewFlowLayout.h"

static NSString *ID = @"carouselCollectionViewCell";

@interface EVNCarouselView()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation EVNCarouselView

- (instancetype)initWithImageArray:(NSArray *)imageArray
{
    self = [super init];
    if (self)
    {
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[EVNCarouseCollectionViewFlowLayout alloc] init]];
        [collectionView registerClass:[EVNCarouselCollectionViewCell class] forCellWithReuseIdentifier:ID];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [self addSubview:collectionView];

        self.collectionView = collectionView;
        self.imageArray = imageArray;

        [self addSubview:self.pageControl]; // 添加分页器

        // 回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.imageArray.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
            [self addTimer]; // 添加定时器
        });
    }
    return self;
}

#pragma mark: 懒加载pageControl
- (UIPageControl *)pageControl
{
    if (!_pageControl)
    {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 170, 0, 30)];
        _pageControl.numberOfPages = self.imageArray.count;
        _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:82.0/255.0 green:157.0/255.0 blue:219.0/255.0 alpha:1.0];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return _pageControl;
}

#pragma mark UICollectionViewDataSource 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count * 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EVNCarouselCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.imageName = self.imageArray[indexPath.item % self.imageArray.count];
    return cell;
}

#pragma mark - UICollectionViewDelegate

#pragma mark: 开始拖地时调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}

#pragma mark: 当滚动减速时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger page = offsetX / scrollView.bounds.size.width;
    if (page == 0)
    {
        page = self.imageArray.count;
        self.collectionView.contentOffset = CGPointMake(page * scrollView.frame.size.width, 0);
    }
    else if (page == [self.collectionView numberOfItemsInSection:0] - 1)
    {
        page = self.imageArray.count - 1;
        self.collectionView.contentOffset = CGPointMake(page * scrollView.frame.size.width, 0);
    }
    NSInteger currentPage = page % self.imageArray.count; // 设置UIPageControl当前页
    self.pageControl.currentPage =currentPage;
    [self addTimer]; // 添加定时器
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer]; // 移除定时器
}

#pragma mark: 添加定时器
- (void)addTimer
{
    if (self.timer) return;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark: 移除定时器
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark: 切换到下一张图片
- (void)nextImage
{
    CGFloat offsetX = self.collectionView.contentOffset.x;
    NSInteger page = offsetX / self.collectionView.bounds.size.width;
    [self.collectionView setContentOffset:CGPointMake((page + 1) * self.collectionView.bounds.size.width, 0) animated:YES];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

- (void)dealloc
{
    [self removeTimer];
}

@end
