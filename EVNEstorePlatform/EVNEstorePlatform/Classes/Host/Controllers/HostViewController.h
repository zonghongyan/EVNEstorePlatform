//
//  HostViewController.h
//  EVNEstorePlatform
//
//  Created by developer on 2016/12/30.
//  Copyright © 2016年 仁伯安. All rights reserved.
//

#import "BaseViewController.h"
#import "HotWordSearchViewController.h"
#import "EVNSearchBar.h"

@interface HostViewController : BaseViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, EVNSearchBarDelegate, HotWordSearchViewDelegate>

/**
 *  searchBar
 */
@property (strong, nonatomic) EVNSearchBar *searchBar;

@end

/************************************************************************
 * 作者: 仁伯安
 * 作者GitHub链接: https://github.com/zonghongyan
 * 作者简书链接：http://www.jianshu.com/users/ac49bc773ff9
 * 著作权归作者所有，转载请联系作者获得授权，并标注“作者”。
 ************************************************************************/
