//
//  HotWordSearchViewController.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/4.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "HotWordSearchViewController.h"
#import "HotWordsTableViewCell.h"
#import "HelpHeaderFile.h"
#import "EVNHelper.h"

@interface HotWordSearchViewController ()
{
    NSString *_viewControllerName;

    UILabel *hotSearchLab;

    NSMutableArray *hotSearchdataSourceArray;

    NSMutableArray *historyDataSourceArray;
    CGFloat historyCellHeight;

    BOOL isSecondIn;

    CGFloat dataSourceNum;

}

@property (strong, nonatomic) UIView *hotWordView;

@end

static NSString *reUserID = @"collectionViewReUserID";

@implementation HotWordSearchViewController

- (instancetype)initWithViewControllerName:(NSString *)viewControllerName
{
    self = [super init];
    if (self)
    {
        _viewControllerName = viewControllerName; // @"HostViewController.h";
        // [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.navigationController.navigationBar setValue:@(1.0) forKeyPath:@"backgroundView.alpha"];

    if(![[NSUserDefaults standardUserDefaults] objectForKey:@"SixHostSearchListArray"])
    {
        historyDataSourceArray = [[NSMutableArray alloc] init];
    }
    else
    {
        historyDataSourceArray = [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"SixHostSearchListArray"]];
    }

    if (historyDataSourceArray.count == 0)
    {
        dataSourceNum = 1;
    }
    else
    {
        dataSourceNum = 2;
    }

    if (isSecondIn)
    {
        [self.historySearchTableView reloadData];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    if ([_viewControllerName isEqualToString:@"HostViewController"])
//    {
//        [self.navigationController setNavigationBarHidden:!animated animated:YES];
//    }
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];


//    if ([_viewControllerName isEqualToString:@"HostViewController"])
//    {
//        [self.navigationController setNavigationBarHidden:animated animated:YES];
//    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.navigationItem.titleView = self.searchBar;
//    [self.searchBar becomeFirstResponder];
#pragma mark: 热词获取
//    hotSearchdataSourceArray = [[NSMutableArray alloc] init]; // @[@"YJV",@"电热管",@"吸顶灯",@"感应开关",@"吸顶灯",@"热缩中间接头",@"套管",@"橡套电缆"];
    hotSearchdataSourceArray = [[NSMutableArray alloc] initWithObjects:@"YJV", @"电热管", @"吸顶灯", @"感应开关", @"吸顶灯", @"热缩中间接头", @"套管", @"橡套电缆", nil];

    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, LineWidth)];
    lineView.backgroundColor = LINECOCOR;
    [self.view addSubview:lineView];

    historyCellHeight = 37.f*ScreenScaleX;

    isSecondIn = YES;
    [self.view addSubview:self.historySearchTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter method
//- (EVNSearchBar *)searchBar
//{
//    if (!_searchBar)
//    {
//        _searchBar = [[EVNSearchBar alloc] initWithFrame:CGRectMake(0, 20, MainScreenWidth, 44) andWithIsShowCancelBtn:YES];
//        _searchBar.evnSearchBarDelegate = self;
//        _searchBar.placeholder = @"搜电工电气产品";
//    }
//    return _searchBar;
//}


//#pragma mark - UISearchBarDelegate 代理方法
//- (void)evnSearchBarCancelButtonClicked:(UISearchBar *)searchBar   // called when cancel button pressed
//{
//    if ([searchBar isFirstResponder])
//    {
//        [searchBar resignFirstResponder];
//    }
//    if ([self.hotWordSearchViewDelegate respondsToSelector:@selector(hotWordSearchDismiss)])
//    {
//        [self.hotWordSearchViewDelegate hotWordSearchDismiss];
//    }
//}
//
//- (void)evnSearchBarSearchButtonClicked:(UISearchBar *)searchBar
//{
//    NSString *text = [searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@""];
//    if(historyDataSourceArray)
//    {
//        NSString *title = [NSString stringWithFormat:@"%@",text];
//        [historyDataSourceArray addObject:title];
//
//        NSOrderedSet *orderSet = [NSOrderedSet orderedSetWithArray:historyDataSourceArray];
//        NSLog(@"%@", orderSet.array);
//
//        [[NSUserDefaults standardUserDefaults] setObject:orderSet.array forKey:@"SixHostSearchListArray"];
//
//        if ([self.hotWordSearchViewDelegate respondsToSelector:@selector(hotWordSearchSkipViewController:)])
//        {
//            [self.hotWordSearchViewDelegate hotWordSearchSkipViewController:title];
//        }
//    }
//}

//#pragma mark: 语音识别
//- (void)onVoiceResult:(NSString *)resultStr
//{
//    if ([self.hotWordSearchViewDelegate respondsToSelector:@selector(hotWordSearchSkipViewController:)])
//    {
//        [self.hotWordSearchViewDelegate hotWordSearchSkipViewController:resultStr];
//    }
//}

#pragma mark - 热搜单击搜索
#pragma mark: UICollectionView
- (UICollectionView *)hotSearchCollectionView
{
    if (!_hotSearchCollectionView)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal]; // 水平滑动
        // flowLayout.minimumInteritemSpacing = 0.f; //如果水平滑动，就是垂直间距
        flowLayout.minimumLineSpacing = 0.f; //如果是水平滑动，就是水平间距

        _hotSearchCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(hotSearchLab.frame.origin.x + hotSearchLab.frame.size.width, 0, MainScreenWidth - (hotSearchLab.frame.origin.x + hotSearchLab.frame.size.width), hotSearchLab.frame.size.height) collectionViewLayout:flowLayout];
        _hotSearchCollectionView.showsHorizontalScrollIndicator = NO;
        _hotSearchCollectionView.delegate = self;
        _hotSearchCollectionView.dataSource = self;

        _hotSearchCollectionView.backgroundColor = [UIColor whiteColor];

        [_hotSearchCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reUserID];

    }
    return _hotSearchCollectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return hotSearchdataSourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reUserID forIndexPath:indexPath];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.userInteractionEnabled = NO;
    [button setTitleColor:TextColor forState:UIControlStateNormal];
    button.backgroundColor = [EVNHelper colorWithHexString:@"#e5e5e5" alpha:1.0];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.titleLabel.font = [UIFont systemFontOfSize:13];

    button.layer.cornerRadius = 2.f;

    NSString *hotWordsData = hotSearchdataSourceArray[indexPath.item];

    CGSize adSize = [EVNHelper adjustWithFont:[UIFont systemFontOfSize:13] WithText:hotWordsData WithSize:CGSizeMake(MAXFLOAT, 33)];

    CGSize adjustSize = CGSizeMake(adSize.width + 20*ScreenScaleX, 33);
    button.frame = CGRectMake(2, (hotSearchLab.frame.size.height - 33 - 15)/2.f, adjustSize.width - 4, 33 - 10);
    [button setTitle:hotWordsData forState:UIControlStateNormal];

    for (id subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }

    [cell.contentView addSubview:button];
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout
// 定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *hotWordsData = hotSearchdataSourceArray[indexPath.item];
    CGSize adSize = [EVNHelper adjustWithFont:[UIFont systemFontOfSize:13] WithText:hotWordsData WithSize:CGSizeMake(MAXFLOAT, 33)];

    CGSize adjustSize = CGSizeMake(adSize.width + 20*ScreenScaleX, 33);
    //    NSLog(@"adjustSize %f", adjustSize.width);

    return adjustSize;
}

/**
 *  选中collectionView的某行cell
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *hotWordsData = hotSearchdataSourceArray[indexPath.item];
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    for (NSObject *obj in cell.contentView.subviews)
    {
        if ([obj isMemberOfClass:[UIButton class]])
        {
            UIButton *button = (UIButton *)obj;
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            NSLog(@"%@", button.titleLabel.text);

#pragma mark - 热搜单击搜索
            if(historyDataSourceArray)
            {
                NSString *title = [NSString stringWithFormat:@"%@", hotWordsData];
                [historyDataSourceArray addObject:title];

                NSOrderedSet *orderSet = [NSOrderedSet orderedSetWithArray:historyDataSourceArray];
                NSLog(@"%@", orderSet.array);

                [[NSUserDefaults standardUserDefaults] setObject:orderSet.array forKey:@"SixHostSearchListArray"];

                if ([self.hotWordSearchViewDelegate respondsToSelector:@selector(hotWordSearchSkipViewController:)])
                {
                    [self.hotWordSearchViewDelegate hotWordSearchSkipViewController:title];
                }
            }
        }
    }
}

/**
 *  item之间的间距，貌似没有起作用啊
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0f;
}

- (UIView *)hotWordView
{
    if (!_hotWordView)
    {
        _hotWordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 50*ScreenScaleX)];
        hotSearchLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50*ScreenScaleX, _hotWordView.bounds.size.height)];
        hotSearchLab.textColor = [UIColor darkTextColor];
        hotSearchLab.font = [UIFont systemFontOfSize:12];
        hotSearchLab.text = @"热搜  ";
        hotSearchLab.textAlignment = NSTextAlignmentCenter;

        [_hotWordView addSubview:hotSearchLab];

        [_hotWordView addSubview:self.hotSearchCollectionView];
    }
    return _hotWordView;
}

#pragma mark - 历史搜索列表
- (UITableView *)historySearchTableView
{
    if (!_historySearchTableView)
    {
        _historySearchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, MainScreenHeight - 64) style:UITableViewStylePlain]; // CGRectGetMaxY(self.searchBar.frame)
        _historySearchTableView.delegate = self;
        _historySearchTableView.dataSource = self;
        _historySearchTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _historySearchTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _historySearchTableView.showsVerticalScrollIndicator = NO;
        _historySearchTableView.showsHorizontalScrollIndicator = NO;
    }
    return _historySearchTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataSourceNum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }
    return 30*ScreenScaleX;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return nil;
    }
    else
    {
        UIView *viewBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 30*ScreenScaleX)];

        UILabel *headLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, MainScreenWidth, 30*ScreenScaleX - 1)];
        headLab.backgroundColor = [UIColor whiteColor];
        headLab.font = [UIFont systemFontOfSize:12];;
        headLab.textColor = [UIColor darkTextColor];
        headLab.text = @"历史搜索";
        UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, headLab.frame.size.height, MainScreenWidth, LineWidth)];

        viewLine.backgroundColor = LINECOCOR;
        [viewBackGroundView addSubview:headLab];
        [viewBackGroundView addSubview:viewLine];

        return viewBackGroundView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return nil;
    }
    else
    {
        UIView *backGrView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, 55*ScreenScaleX)];
        backGrView.backgroundColor = [UIColor whiteColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"清空历史记录" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitleColor:TextColor forState:UIControlStateNormal];
        button.frame = CGRectMake(20, (backGrView.bounds.size.height - 33)/2.f, MainScreenWidth - 40, 44);
        button.layer.borderColor = [UIColor grayColor].CGColor;
        button.layer.borderWidth = LineWidth;
        button.layer.cornerRadius = 2.f;
        [button addTarget:self action:@selector(clearHistorySearchBtnAction) forControlEvents:UIControlEventTouchUpInside];

        [button.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [button setImage:[UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake((44 - 16)/2.f, 0, (44 - 16)/2.f, 5)]; // top left bottom right
        [button setTitleEdgeInsets:UIEdgeInsetsMake(10, -(button.imageView.frame.size.width - button.imageView.frame.size.height)/2 + 5, 10, 0)]; //4个参数是上边界，左边界，下边界，右边界。

        [backGrView addSubview:button];
        return backGrView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 10;
    }
    else
    {
        return 55*ScreenScaleX;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    return historyDataSourceArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 50*ScreenScaleX;
    }
    return historyCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *reuseIdentifier = @"historySearchID";
    HotWordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell)
    {
        cell = [[HotWordsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }

    while ([[cell.contentView subviews] lastObject])
    {
        [[[cell.contentView subviews] lastObject] removeFromSuperview];
    }

    if (indexPath.section == 0)
    {
        [cell.contentView addSubview:self.hotWordView];
        [self.hotSearchCollectionView reloadData];
    }
    else
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, MainScreenWidth, historyCellHeight - 1)];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = TextColor;
        label.text = historyDataSourceArray[historyDataSourceArray.count - indexPath.row - 1];
        [cell.contentView addSubview:label];
        UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, label.frame.size.height, MainScreenWidth, 0.5)];
        viewLine.backgroundColor = LINECOCOR;
        [cell.contentView addSubview:viewLine];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.hotWordSearchViewDelegate respondsToSelector:@selector(hotWordSearchSkipViewController:)])
    {
        [self.hotWordSearchViewDelegate hotWordSearchSkipViewController:historyDataSourceArray[historyDataSourceArray.count - indexPath.row - 1]];
    }
}

- (UITableViewCellEditingStyle )tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        return UITableViewCellEditingStyleNone; // 不然热搜也可以删除啦
    }
    return UITableViewCellEditingStyleDelete;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if (historyDataSourceArray.count == 1)
        {
            [self clearHistorySearchBtnAction];
        }
        else
        {
            [historyDataSourceArray removeObjectAtIndex:indexPath.row];
            [[NSUserDefaults standardUserDefaults] setObject:historyDataSourceArray forKey:@"SixHostSearchListArray"];
            [tableView reloadData]; // 重新加载数据的时候记得修改TableView的高度
        }
    }
}


- (void)clearHistorySearchBtnAction
{
    if(historyDataSourceArray)
    {
        NSArray *array = [[NSArray alloc] init];
        [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"SixHostSearchListArray"];
        [historyDataSourceArray removeAllObjects];
    }

    if (historyDataSourceArray.count == 0)
    {
        dataSourceNum = 1;
    }
    else
    {
        dataSourceNum = 2;
    }
    [self.historySearchTableView reloadData];
}

@end
