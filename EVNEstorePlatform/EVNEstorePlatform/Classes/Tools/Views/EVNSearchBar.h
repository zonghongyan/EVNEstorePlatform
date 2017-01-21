//
//  EVNSearchBar.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/2.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <UIKit/UIKit.h>

/************************************************************************
 * 作者: 仁伯安
 * 作者GitHub链接: https://github.com/zonghongyan
 * 作者简书链接：http://www.jianshu.com/users/ac49bc773ff9
 * 著作权归作者所有，转载请联系作者获得授权，并标注“作者”。
 ************************************************************************/

@protocol EVNSearchBarDelegate<NSObject>

@optional
/**
 * 语音识别回调
 * @param resultStr 返回语音搜索关键字
 */
- (void)onVoiceResult:(NSString *)resultStr;



/**
 * 取消事件
 */
- (void)evnSearchBarCancelButtonClicked:(UISearchBar *)searchBar;

/**
 * 搜索框中右端事件
 */
- (void)evnSearchBarBookmarkButtonClicked:(UISearchBar *)searchBar; // called when bookmark button pressed

/**
 * 搜索事件
 */
- (void)evnSearchBarSearchButtonClicked:(UISearchBar *)searchBar;

/**
 * 搜索框内容变化时回调
 * @param result 输入框内容
 */
- (void)evnSearchBarSearchResult:(NSString *) result;

/**
 * 激活搜索框
 * @param searchBar 搜索框
 * @return 是否激活
 */
- (BOOL)evnSearchBarShouldBeginEditing:(UISearchBar *)searchBar;                      // return NO to not become first responder

@end

@interface EVNSearchBar : UISearchBar<UISearchBarDelegate>//, IFlyRecognizerViewDelegate>

@property (assign, nonatomic) BOOL isShowCancel;
//@property (strong, nonatomic) IFlyRecognizerView *iflyRecognizerView;
@property (strong, nonatomic) UITextField *searchBarTextField;
@property (assign, nonatomic) id<EVNSearchBarDelegate> evnSearchBarDelegate;

- (instancetype)initWithFrame:(CGRect)frame andWithIsShowCancelBtn:(BOOL) isShowCancelBtn;


@end


/**
 * 自定义搜索右边按钮协议EVNSearchBarViewDelegate
 */
@protocol EVNSearchBarViewDelegate<NSObject>

/**
 * 语音识别回调
 */
- (void)onEVNVoiceResult:(NSString *)resultStr; // 返回语音搜索关键字

/**
 * 搜索框中右端事件
 */
- (void)rightBtnActionEVNSearchBarV:(UIButton *)sender;

@optional

- (BOOL)evnSearchBarViewShouldBeginEditing:(UISearchBar *)searchBar;                      // return NO to not become first responder

- (void)evnSearchBarViewTextDidBeginEditing:(UISearchBar *)searchBar;                     // called when text starts editing

- (BOOL)evnSearchBarViewShouldEndEditing:(UISearchBar *)searchBar;                        // return NO to not resign first responder

- (void)evnSearchBarViewTextDidEndEditing:(UISearchBar *)searchBar;                       // called when text ends editing

- (void)evnSearchBarView:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;   // called when text changes (including clear)

- (BOOL)evnSearchBarView:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text; // called before text changes

- (void)evnSearchBarViewSearchButtonClicked:(UISearchBar *)searchBar;                     // called when keyboard search button pressed
- (void)evnSearchBarViewBookmarkButtonClicked:(UISearchBar *)searchBar;                   // called when bookmark button pressed

- (void)evnSearchBarViewCancelButtonClicked:(UISearchBar *)searchBar;                     // called when cancel button pressed

- (void)evnSearchBarViewResultsListButtonClicked:(UISearchBar *)searchBar;                // called when search results button pressed

- (void)evnSearchBarView:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope;


@end


/***************************EVNSearchBarView*******************************
 * 如果将EVNSearchBarView加到导航栏有两种方式
 * 1、[self.navigationController.navigationBar addSubview:self.searchBarView];
 * 2、 self.navigationItem.titleView = self.searchBarView;
 * 如果使用方式1的话，记得在viewDidDisappear方法中
 * 移除[self.searchBarView removeFromSuperview];
 */

/**
 * 自定义搜索右边按钮样式搜索框
 */

@interface EVNSearchBarView:UIView <UISearchBarDelegate, EVNSearchBarDelegate>

@property (strong, nonatomic) EVNSearchBar *searchBar;

@property (strong, nonatomic) UIButton *rightButton;

@property (assign, nonatomic) id<EVNSearchBarViewDelegate> evnSearchBarViewDelegate;

- (instancetype)initWithFrame:(CGRect)frame andWithRightBtnTitle:(NSString *)title andWithRightBtnImage:(NSString *)rightImageName;


@end
