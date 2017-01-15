//
//  HostViewController.m
//  EVNEstorePlatform
//
//  Created by developer on 2016/12/30.
//  Copyright © 2016年 仁伯安. All rights reserved.
//

#import "HostViewController.h"
#import "HelpHeaderFile.h"
#import "HostHeadCollectionViewFlowLayout.h"
#import "HostCollectionViewCell.h"
#import "HostHeadCollectionReusableView.h"


static NSString *ID = @"hostCollectionViewCell";

@interface HostViewController ()
{
    HotWordSearchViewController *hotWordSearchViewController;
}
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HostViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    self.navigationController.navigationBar.hidden = YES; // 隐藏navigationBar
    [UIView animateWithDuration:1.0 animations:^{
        [self.navigationController.navigationBar setValue:@(0.1) forKeyPath:@"backgroundView.alpha"];
    }];
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
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -64, MainScreenWidth, MainScreenHeight - 49) collectionViewLayout:[[HostHeadCollectionViewFlowLayout alloc] init]];
        _collectionView.backgroundColor = RGBACOLOR(238, 238, 238, 1);
        [_collectionView registerClass:[HostCollectionViewCell class] forCellWithReuseIdentifier:ID]; // 注册cell
        // 注册UICollectionReusableView即headerView（切记要添加headerView一定要先注册）
        [_collectionView registerClass:[HostHeadCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];

        _collectionView.delegate = self;
        _collectionView.dataSource = self;

        [_collectionView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];  // KVO 添加监听者,用于导航栏偏移改变透明度
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 80;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HostCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.iconName = [NSString stringWithFormat:@"picture%ld", indexPath.row%7];
    cell.describe = @"远东电线电缆 国际品质";
    cell.currentPrice = @"¥111";
    cell.originalPrice = @"¥112";
    return cell;
}

#pragma mark: 添加headerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HostHeadCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];;

    if (kind == UICollectionElementKindSectionHeader)  // 判断上面注册的UICollectionReusableView类型
    {
        return headerView;
    }
    else
    {
        return nil;
    }
}

#pragma mark - UICollectionViewDelegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.bounds.size.width, 380); // 设置headerView的宽高
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(14, 0, 0, 0); //设置collectionView的cell上、左、下、右的间距
}

#pragma mark - 监听goodsTableView的contentOffset属性值发生改变时回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    CGFloat offset = _collectionView.contentOffset.y;
    CGFloat delta = MAX(0, (offset - 160) / 160*ScreenScaleY + 1.f);
    self.searchBar.searchBarTextField.backgroundColor = RGBACOLOR(233.f, 233.f, 233.f, MAX(0.6, delta));
    [self.navigationController.navigationBar setValue:@(MIN(0.9, delta)) forKeyPath:@"backgroundView.alpha"];
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

#pragma mark - UISearchBarDelegate 代理方法
- (void)evnSearchBarCancelButtonClicked:(UISearchBar *)searchBar   // called when cancel button pressed
{
    if ([searchBar isFirstResponder])
    {
        [searchBar resignFirstResponder];
    }
    [self hotWordSearchDismiss];
}

- (BOOL)evnSearchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [self.searchBar setShowsCancelButton:YES animated:YES];
    [self.tabBarController.tabBar setHidden:YES];

    hotWordSearchViewController = [[HotWordSearchViewController alloc] initWithViewControllerName:@"HostViewController"];

    hotWordSearchViewController.hotWordSearchViewDelegate = self;
    [self addChildViewController:hotWordSearchViewController];
    [self.view addSubview:hotWordSearchViewController.view];

    return YES;
}

#pragma mark - HotWordSearchViewDelegate方法,搜索页取消时移除当前视图
- (void)hotWordSearchDismiss
{
    [self.searchBar setShowsCancelButton:NO animated:YES];
    [self.tabBarController.tabBar setHidden:NO];

    for (UIViewController *viewController in self.childViewControllers)
    {
        if ([viewController isKindOfClass:[HotWordSearchViewController class]])
        {
            [viewController willMoveToParentViewController:self];
            [viewController.view removeFromSuperview];
            [viewController removeFromParentViewController];
        }
    }

    hotWordSearchViewController.hotWordSearchViewDelegate = self;
    hotWordSearchViewController = nil;
}

#pragma mark: 搜索页传过来的keyWord
- (void)hotWordSearchSkipViewController:(NSString *)hotWordString
{
    [self hotWordSearchDismiss];

    //    NSString *keyWordString = [NSString stringWithFormat:@"keywords=%@&", hotWordString];

    //    B2CShoppingListViewController *filterProductListViewController = [[B2CShoppingListViewController alloc] initWithChannelIdOrKeyWord:keyWordString];
    //    filterProductListViewController.hidesBottomBarWhenPushed = YES;
    //    [self.navigationController pushViewController:filterProductListViewController animated:YES];
    //    [self setHidesBottomBarWhenPushed:NO];

}

- (void)dealloc
{
    // 移除监听
    [_collectionView removeObserver:self forKeyPath:@"contentOffset"];
}


@end
