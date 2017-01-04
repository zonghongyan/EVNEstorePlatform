//
//  HotWordSearchViewController.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/4.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "BaseViewController.h"
#import "EVNSearchBar.h"

@protocol HotWordSearchViewDelegate <NSObject>

/**
 * 移除当前ViewController
 */
- (void)hotWordSearchDismiss;

/**
 * 搜索关键词回调
 * @param hotWordString 搜索的关键字
 */
- (void)hotWordSearchSkipViewController:(NSString *)hotWordString;

@end


@interface HotWordSearchViewController : BaseViewController<UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, EVNSearchBarDelegate>

/**
 *  searchBar
 */
//@property (strong, nonatomic) EVNSearchBar *searchBar;

/**
 *  热词搜索
 */
@property (strong, nonatomic) UICollectionView *hotSearchCollectionView;

/**
 *  历史搜索
 */
@property (strong, nonatomic) UITableView *historySearchTableView;


/**
 *  @param viewControllerName 在host首页H5页面跳转过来
 */
- (instancetype)initWithViewControllerName:(NSString *)viewControllerName;


/**
 * 消失掉当前页面代理
 */

@property(assign, nonatomic) id<HotWordSearchViewDelegate> hotWordSearchViewDelegate;

@end
