//
//  EVNHUD.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/21.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "EVNHUD.h"
#import "HelpHeaderFile.h"

static MBProgressHUD* hud;
const int lineWidth = 3; // 白边宽度

@implementation EVNHUD

/**
 *  初始化EVNHUD
 */
+ (MBProgressHUD *)sharedHUD
{

    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{ // 将其定义为单例模式
    if (!hud)
    {
        hud = [[MBProgressHUD alloc] initWithView:[[UIApplication sharedApplication].delegate window]];
        hud.removeFromSuperViewOnHide = YES;
    }
    //    });
    return hud;
}

/**
 *  隐藏EVNHUD
 */
+ (void)hideHUD
{
    if([self sharedHUD].superview)
    {
        [[self sharedHUD] hideAnimated:YES];
    }
}

/**
 *  显示EVNHUD 只有图片
 */
+ (void)showLoadingHUD
{
    [self showLoadingHUDWithText:nil];
}

/**
 *  显示EVNHUD（图片+文字）
 */
+ (void)showLoadingHUDWithText:(NSString *)text
{
    [self showLoadingHUDWithText:text inView:nil];
}

/**
 *  自定义View部分
 */
+ (void)showLoadingHUDWithText:(NSString *)text inView:(UIView *)containerView
{
    UIImageView *imgView;

    imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AppIcon.png"]];

    // 自定义图片 // @"Icon.png";
    imgView.layer.cornerRadius = imgView.bounds.size.width / 2.2f;
    imgView.layer.masksToBounds = YES;
    UIView *customerView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, imgView.frame.size.width, imgView.frame.size.width)];
    [customerView addSubview:imgView];
    imgView.center = customerView.center;

    // 外围背景Layer
    CAShapeLayer *borderLayer = [[CAShapeLayer alloc] init];
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor whiteColor].CGColor; // 自定义图片白边儿
    borderLayer.lineWidth = lineWidth;
    borderLayer.bounds = imgView.bounds;
    borderLayer.position = CGPointMake(CGRectGetMidX(imgView.bounds), CGRectGetMidY(imgView.bounds));
    // borderLayer.path = [UIBezierPath bezierPathWithArcCenter:borderLayer.position radius:(borderLayer.bounds.size.width)/2.0f startAngle:0 endAngle:M_PI * 2.0f clockwise:YES].CGPath;
    borderLayer.path = [UIBezierPath bezierPathWithArcCenter:borderLayer.position radius:(borderLayer.bounds.size.width - 1)/2.0f startAngle:0 endAngle:M_PI * 2.0f clockwise:YES].CGPath; // -1 有点缝隙，稍稍好看些

    [imgView.layer addSublayer:borderLayer];

    // 滚动中得Layer
    CAShapeLayer *animationLayer = [[CAShapeLayer alloc] init];
    animationLayer.strokeColor = RGBACOLOR(206, 37, 50, 1.0).CGColor;
    // animationLayer.strokeColor = [UIColor redColor].CGColor;
    animationLayer.lineWidth = borderLayer.lineWidth;
    // animationLayer.lineWidth = borderLayer.lineWidth - 1;
    animationLayer.fillColor = [UIColor clearColor].CGColor;
    animationLayer.bounds = borderLayer.bounds;
    animationLayer.position = borderLayer.position;
    animationLayer.path = [UIBezierPath bezierPathWithArcCenter:borderLayer.position radius:(borderLayer.bounds.size.width)/2.0f startAngle:0 endAngle:M_PI_2*1 clockwise:YES].CGPath;

    // 渐变色Layer
    CAGradientLayer *gradienLayer = [[CAGradientLayer alloc] init];
    gradienLayer.bounds = borderLayer.bounds;
    gradienLayer.position = borderLayer.position;
    gradienLayer.colors = [self gradientColorArrayWithColor:[UIColor grayColor]]; // 旋转圆弧的颜色
    gradienLayer.startPoint = CGPointMake(lineWidth, lineWidth); // 旋转圆弧的开始的宽度
    gradienLayer.endPoint = CGPointMake(lineWidth, lineWidth);
    [gradienLayer setMask:animationLayer];
    [imgView.layer addSublayer:gradienLayer];

    // 动画写法一
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * 1 * 10];
    rotationAnimation.duration = 10;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    [animationLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];

    // 动画写法二
    //    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    //    anim.keyPath = @"transform";
    //    NSValue *val1 = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.0 * M_PI, 0, 0, 1)];
    //    NSValue *val2 = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.5 * M_PI, 0, 0, 1)];
    //    NSValue *val3 = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(1.0 * M_PI, 0, 0, 1)];
    //    NSValue *val4 = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(1.5 * M_PI, 0, 0, 1)];
    //    NSValue *val5 = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(2.0 * M_PI, 0, 0, 1)];
    //    anim.values = @[val1, val2, val3, val4, val5];
    //    anim.duration = 1.0;
    //    anim.removedOnCompletion = NO;
    //    anim.fillMode = kCAFillModeForwards;
    //    anim.repeatCount = MAXFLOAT;
    //    anim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //    [animationLayer addAnimation:anim forKey:@"ringLayerAnimation"];

    MBProgressHUD *hud = [self sharedHUD];
    [self appendToView:containerView];
    hud.customView = customerView;
    [hud setOpacity:0.2]; //.opacity = 0.2;    // MBProgressHUD透明度
    hud.mode = MBProgressHUDModeCustomView;
    hud.margin = 3.0f;   // 设置EVNHUD和customerView的边距（默认是20）
    hud.yOffset = -20.0f; // 设置EVNHUD距离中心位置的y偏移（同理也可以设置xOffset）
    // hud.userInteractionEnabled = NO;
    // userInteractionEnabled=NO时，不会遮挡containerView，view可以正常响应
    if (text.length > 0)
    {
        hud.label.text = text;
    }
    [hud showAnimated:YES];
}


#pragma mark - private method
+ (void)appendToView:(UIView *)containerView
{
    if (containerView)
    {
        [containerView addSubview:[self sharedHUD]];
    }
    else
    {
        [[[UIApplication sharedApplication].delegate window] addSubview:[self sharedHUD]];
    }
}

+ (NSArray *)gradientColorArrayWithColor: (UIColor *)color
{
    if (!color)
    {
        return nil;
    }
    // 这代码看不懂
    return @[ (id)[color colorWithAlphaComponent:0.0].CGColor,
              (id)[color colorWithAlphaComponent:0.1].CGColor,
              (id)[color colorWithAlphaComponent:0.2].CGColor,
              (id)[color colorWithAlphaComponent:0.3].CGColor,
              (id)[color colorWithAlphaComponent:0.6].CGColor,
              (id)[color colorWithAlphaComponent:0.8].CGColor,
              (id)[color colorWithAlphaComponent:1.0].CGColor,
              (id)[color colorWithAlphaComponent:1.0].CGColor,
              (id)[color colorWithAlphaComponent:1.0].CGColor ];
    
}

+ (void)attemptDealloc
{
    hud = nil;
}


@end
