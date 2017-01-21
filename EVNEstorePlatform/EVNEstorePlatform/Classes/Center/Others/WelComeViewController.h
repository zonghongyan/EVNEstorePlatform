//
//  WelComeViewController.h
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/21.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "BaseViewController.h"

@interface WelComeViewController : BaseViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIScrollView *sv;
@property (weak, nonatomic) IBOutlet UIImageView *iv_Fir;
@property (weak, nonatomic) IBOutlet UIImageView *iv_Sec;
@property (weak, nonatomic) IBOutlet UIImageView *iv_Third;

@property (strong,nonatomic) UIPageControl *pageControl;

@end


/************************************************************************
 * 作者: 仁伯安
 * 作者GitHub链接: https://github.com/zonghongyan
 * 作者简书链接：http://www.jianshu.com/users/ac49bc773ff9
 * 著作权归作者所有，转载请联系作者获得授权，并标注“作者”。
 ************************************************************************/
