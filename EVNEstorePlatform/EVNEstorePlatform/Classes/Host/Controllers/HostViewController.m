//
//  HostViewController.m
//  EVNEstorePlatform
//
//  Created by developer on 2016/12/30.
//  Copyright © 2016年 仁伯安. All rights reserved.
//

#import "HostViewController.h"
#import "HelpHeaderFile.h"

static NSString *ID = @"hostCollectionViewCell";

@interface HostViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HostViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    self.navigationController.navigationBar.hidden = YES; // 隐藏navigationBar
//    [self.navigationController.navigationBar setValue:@(0.1) forKeyPath:@"backgroundView.alpha"];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.navigationController.navigationBar addSubview:self.searchBar];

    [self.view addSubview:self.collectionView];     // 添加collectionView
    self.collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
//        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -64, MainScreenWidth, MainScreenHeight - 49) collectionViewLayout:[[HostHeadCollectionViewFlowLayout alloc] init]];
//        _collectionView.backgroundColor = RGBACOLOR(238, 238, 238, 1);
//        // 注册cell
//        [_collectionView registerClass:[HostCollectionViewCell class] forCellWithReuseIdentifier:ID];
//        // 注册UICollectionReusableView即headerView（切记要添加headerView一定要先注册）
//        [_collectionView registerClass:[HostHeadCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
//
//        _collectionView.delegate = self;
//        _collectionView.dataSource = self;
//
//        [_collectionView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];  // KVO 添加监听者,用于导航栏偏移改变透明度
    }
    return _collectionView;
}


#pragma mark - getter method
- (EVNSearchBar *)searchBar
{
    if (!_searchBar)
    {
        _searchBar = [[EVNSearchBar alloc] initWithFrame:CGRectMake(10, 0, MainScreenWidth - 20, 44) andWithIsShowCancelBtn:NO];
        _searchBar.evnSearchBarDelegate = self;

    }

    return _searchBar;
}

#pragma mark - 监听goodsTableView的contentOffset属性值发生改变时回调
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    CGFloat offset = _collectionView.contentOffset.y;
//    CGFloat delta = MAX(0, (offset - 160) / 160*ScreenScaleY + 1.f);
//    self.searchBar.searchBarTextField.backgroundColor = RGBACOLOR(233.f, 233.f, 233.f, MAX(0.6, delta));
//    [self.navigationController.navigationBar setValue:@(MIN(0.9, delta)) forKeyPath:@"backgroundView.alpha"];
//}

#pragma mark - UISearchBarDelegate 代理方法
- (void)evnSearchBarCancelButtonClicked:(UISearchBar *)searchBar   // called when cancel button pressed
{
    if ([searchBar isFirstResponder])
    {
        [searchBar resignFirstResponder];
    }

}

- (BOOL)evnSearchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return NO;
}

- (void)dealloc
{
    // 移除监听
//    [_collectionView removeObserver:self forKeyPath:@"contentOffset"];
}


@end
