//
//  EVNHelper.m
//  EVNEstorePlatform
//
//  Created by developer on 2017/1/2.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "EVNHelper.h"

@implementation EVNHelper

+ (NSString *)getNumFromString:(NSString *)string
{
    NSString *price = @"";
    for(int i=0;i<string.length;i++)
    {
        char c = [string characterAtIndex:i];
        if(c == '.' || c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9')
        {
            price = [price stringByAppendingFormat:@"%c",c];
        }
    }
    return price;
}

+ (BOOL)validateString:(NSString *)str
{
    if(str.length ==  0 || [str isKindOfClass:[NSNull class]] || str == nil || str == NULL || [str isEqualToString:@"(null)"] || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 || [str isEqualToString:@"null"])
    {
        return NO;
    }
    return YES;
}

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

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    // 删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    if ([cString length] < 6) // String should be 6 or 8 characters
    {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) // 如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    {
        cString = [cString substringFromIndex:2];
    }
    // 如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }

    NSRange range; // Separate into r, g, b substrings
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range]; // r
    range.location = 2;
    NSString *gString = [cString substringWithRange:range]; // g
    range.location = 4;
    NSString *bString = [cString substringWithRange:range]; // b
    unsigned int r, g, b; // Scan values
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return reSizeImage;
}

+ (CGFloat)adjustWithFont:(UIFont *)font WithString:(NSString *)string WithSize:(CGSize)size
{
    NSAttributedString *attributedText = [[NSAttributedString alloc]
                                          initWithString:string
                                          attributes:@{NSFontAttributeName:font}];
    CGSize textSize = [attributedText boundingRectWithSize:size
                                                   options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                   context:nil].size;
    return textSize.height;
}

+ (CGSize)adjustWithFont:(UIFont*)font WithText:(NSString *)string WithSize:(CGSize)size
{
    CGSize actualsize;
    if([EVNHelper validateString:string] == NO)
    {
        return actualsize = CGSizeZero;
    }
    else
    {
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil]; // 获取当前文本的属性
        actualsize =[string boundingRectWithSize:actualsize options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
        NSAttributedString *attributedText = [[NSAttributedString alloc]
                                              initWithString:string
                                              attributes:@{NSFontAttributeName:font}];
        actualsize = [attributedText boundingRectWithSize:size
                                                  options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                  context:nil].size;

    }
    return actualsize;
}


@end
