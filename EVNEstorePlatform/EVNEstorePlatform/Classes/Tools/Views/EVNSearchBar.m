//
//  EVNSearchBar.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/2.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "EVNSearchBar.h"
#import "HelpHeaderFile.h"
#import "EVNHelper.h"


@implementation EVNSearchBar

- (instancetype)initWithFrame:(CGRect)frame andWithIsShowCancelBtn:(BOOL) isShowCancelBtn
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setPlaceholder:@"搜索"];                // 搜索框的占位符
        [self setShowsBookmarkButton:YES];
        // [self setBarStyle:UIBarStyleDefault];        // 搜索框样式
        [self setTintColor:[UIColor redColor]];         // 搜索框的颜色，当设置此属性时，barStyle将失效

        // [self setKeyboardType:UIKeyboardTypeEmailAddress];            // 设置键盘样式
        _isShowCancel = isShowCancelBtn;
        //        [self setShowsCancelButton:isShowCancelBtn animated:YES];

        // 是否提供自动修正功能（这个方法一般都不用的）
        // [self setSpellCheckingType:UITextSpellCheckingTypeYes];       // 设置自动检查的类型
        // [self setAutocorrectionType:UITextAutocorrectionTypeDefault]; // 是否提供自动修正功能，一般设置为UITextAutocorrectionTypeDefault

        self.delegate = self;                   // 设置代理
        [self sizeToFit];

        [self setImage:[UIImage imageNamed:@"speak.png"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];       // 修改输入框右端图片Bookmark的图标

        self.backgroundImage = [self imageWithColor:[UIColor clearColor] size:self.bounds.size];            // 清空searchBar的背景色

        for (UIView* subview in [[self.subviews lastObject] subviews])
        {
            if ([subview isKindOfClass:[UIButton class]])
            {
                UIButton *cancelBtn = (UIButton*)subview;
                [cancelBtn setTitleColor:TextColor forState:UIControlStateNormal];
            }
            if ([subview isKindOfClass:[UITextField class]])
            {
                UITextField *textField = (UITextField*)subview;
                textField.textColor = [UIColor darkTextColor];                              //修改输入字体的颜色
                [textField setBackgroundColor:[EVNHelper colorWithHexString:@"#e5e5e5" alpha:1.0]];         // 修改输入框的颜色
                [textField setValue:TextColor forKeyPath:@"_placeholderLabel.textColor"];   //修改placeholder的颜色
                _searchBarTextField = textField;
            }
            else if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
            {
                [subview removeFromSuperview];
            }
        }
    }
    return self;
}


#pragma mark - UISearchBarDelegate 代理方法
- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (_isShowCancel)
    {
        [searchBar setShowsCancelButton:YES animated:YES];
        for (UIView* subview in [[self.subviews lastObject] subviews])
        {
            if ([subview isKindOfClass:[UIButton class]])
            {
                UIButton *cancelBtn = (UIButton*)subview;
                [cancelBtn setTitleColor:TextColor forState:UIControlStateNormal];
            }
        }
    }

    NSLog(@"searchText = %@",searchText);
    if([self.evnSearchBarDelegate respondsToSelector:@selector(evnSearchBarSearchResult:)])
    {
        [self.evnSearchBarDelegate evnSearchBarSearchResult:searchText];
    }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    if (_isShowCancel)
    {
        [searchBar setShowsCancelButton:YES animated:YES];
        for (UIView* subview in [[self.subviews lastObject] subviews])
        {
            if ([subview isKindOfClass:[UIButton class]])
            {
                UIButton *cancelBtn = (UIButton*)subview;
                [cancelBtn setTitleColor:TextColor forState:UIControlStateNormal];
            }
        }
    }

    if ([self.evnSearchBarDelegate respondsToSelector:@selector(evnSearchBarShouldBeginEditing:)])
    {
        return [self.evnSearchBarDelegate evnSearchBarShouldBeginEditing:searchBar];
    }
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar   // called when cancel button pressed
{
    if (_isShowCancel)
    {
        [searchBar setShowsCancelButton:NO animated:YES];
    }
    if ([self.evnSearchBarDelegate respondsToSelector:@selector(evnSearchBarCancelButtonClicked:)])
    {
        [self.evnSearchBarDelegate evnSearchBarCancelButtonClicked:searchBar];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{

    if ([self.evnSearchBarDelegate respondsToSelector:@selector(evnSearchBarSearchButtonClicked:)])
    {
        [self.evnSearchBarDelegate evnSearchBarSearchButtonClicked:searchBar];
    }
}

#pragma mark: 语音识别部分
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"启动识别服务");
    if ([searchBar isFirstResponder])
    {
        [searchBar resignFirstResponder];
    }
    //    if ([EVNAuthorization authorizationAVAudioSession])
    //    {
    //        // 启动识别服务
    //        [self.iflyRecognizerView start];
    //
    //        if ([self.evnSearchBarDelegate respondsToSelector:@selector(evnSearchBarBookmarkButtonClicked:)])
    //        {
    //            [self.evnSearchBarDelegate evnSearchBarBookmarkButtonClicked:searchBar];
    //        }
    //    }
}

#pragma mark - searchBar的代理方法
#pragma mark: IFlySpeechRecognizerDelegate && IFlyRecognizerViewDelegate 科大讯飞

//- (void)onError:(IFlySpeechError *)error
//{
//    [[BaiduMobStat defaultStat] logEvent:@"10047" eventLabel:@"搜索"]; // 百度自定义事件统计
//    if (error.errorCode == 0 )
//    {
//        // [DCFStringUtil showNotice:@"未能识别您说的商品"];
//    }
//    [self.iflyRecognizerView cancel];
//}

- (void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast // 返回搜索关键字
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    for (NSString *key in dic)
    {
        [result appendFormat:@"%@",key];
    }
}


- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    //Create a context of the appropriate size
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();

    //Build a rect of appropriate size at origin 0,0
    CGRect fillRect = CGRectMake(0, 0, size.width, size.height);

    //Set the fill color
    CGContextSetFillColorWithColor(currentContext, color.CGColor);

    //Fill the color
    CGContextFillRect(currentContext, fillRect);

    //Snap the picture and close the context
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return colorImage;
}


- (void)dealloc
{

    self.evnSearchBarDelegate = nil;
}

@end


/**
 * 取消按钮自定义的方式
 */
@implementation EVNSearchBarView

- (instancetype)initWithFrame:(CGRect)frame andWithRightBtnTitle:(NSString *)title andWithRightBtnImage:(NSString *)rightImageName
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.userInteractionEnabled = YES;
        _searchBar = [[EVNSearchBar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width - frame.size.height, frame.size.height) andWithIsShowCancelBtn:NO];

        _searchBar.evnSearchBarDelegate = self;
        _searchBar.delegate = self;

        [self addSubview:_searchBar];

        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (rightImageName != nil)
        {
            _rightButton.frame = CGRectMake(CGRectGetMaxX(self.searchBar.frame) + 7, 7, 30, 30); // 图片
        }
        else
        {
            _rightButton.frame = CGRectMake(CGRectGetMaxX(self.searchBar.frame) + 7, 7, 44*ScreenScaleX, 30); // 文字取消等
        }
        _rightButton.backgroundColor = [UIColor clearColor];
        [_rightButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];

        [_rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:_rightButton];

        [_rightButton setTitle:title  forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark: IFlySpeechRecognizerDelegate && IFlyRecognizerViewDelegate 科大讯飞
- (void)onVoiceResult:(NSString *)resultStr // 返回语音搜索关键字
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(onEVNVoiceResult:)])
    {
        [self.evnSearchBarViewDelegate onEVNVoiceResult:resultStr];
    }
}

#pragma mark: 右边的取消或者其他按钮
- (void)rightButtonAction:(UIButton *)sender
{
    if ([_searchBar isFirstResponder])
    {
        [_searchBar resignFirstResponder];
    }

    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(rightBtnActionEVNSearchBarV:)])
    {
        [self.evnSearchBarViewDelegate rightBtnActionEVNSearchBarV:sender];
    }
}

#pragma mark - UISearchBarDelegate 代理方法
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarViewShouldBeginEditing:)])
    {
        return [self.evnSearchBarViewDelegate evnSearchBarViewShouldBeginEditing:searchBar];
    }
    return YES;
}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarViewTextDidBeginEditing:)])
    {
        return [self.evnSearchBarViewDelegate evnSearchBarViewTextDidBeginEditing:searchBar];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarViewShouldEndEditing:)])
    {
        return [self.evnSearchBarViewDelegate evnSearchBarViewShouldEndEditing:searchBar];
    }
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarViewTextDidEndEditing:)])
    {
        return [self.evnSearchBarViewDelegate evnSearchBarViewTextDidEndEditing:searchBar];
    }
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarView:textDidChange:)])
    {
        return [self.evnSearchBarViewDelegate evnSearchBarView:searchBar textDidChange:searchText];
    }
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0)
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarView: shouldChangeTextInRange: replacementText:)])
    {
        [self.evnSearchBarViewDelegate evnSearchBarView:searchBar shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarViewSearchButtonClicked:)])
    {
        [self.evnSearchBarViewDelegate evnSearchBarViewSearchButtonClicked:searchBar];
    }
}

// 语音识别
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED
{
    NSLog(@"启动识别服务");
    if ([searchBar isFirstResponder])
    {
        [searchBar resignFirstResponder];
    }

    //    if ([EVNAuthorization authorizationAVAudioSession])
    //    {
    //        // 启动识别服务
    //        [self.searchBar.iflyRecognizerView start];
    //        if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarViewBookmarkButtonClicked:)])
    //        {
    //            [self.evnSearchBarViewDelegate evnSearchBarViewBookmarkButtonClicked:searchBar];
    //        }
    //    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarViewCancelButtonClicked:)])
    {
        [self.evnSearchBarViewDelegate evnSearchBarViewCancelButtonClicked:searchBar];
    }
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarViewResultsListButtonClicked:)])
    {
        [self.evnSearchBarViewDelegate evnSearchBarViewResultsListButtonClicked:searchBar];
    }
}
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope NS_AVAILABLE_IOS(3_0)
{
    if ([self.evnSearchBarViewDelegate respondsToSelector:@selector(evnSearchBarView:selectedScopeButtonIndexDidChange:)])
    {
        [self.evnSearchBarViewDelegate evnSearchBarView:searchBar selectedScopeButtonIndexDidChange:selectedScope];
    }
}

- (void)dealloc
{
    
    self.searchBar.evnSearchBarDelegate = nil;
}

@end
