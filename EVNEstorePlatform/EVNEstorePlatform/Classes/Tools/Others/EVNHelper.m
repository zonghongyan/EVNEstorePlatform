//
//  EVNHelper.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/2.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "EVNHelper.h"

@implementation EVNHelper


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
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


@end
