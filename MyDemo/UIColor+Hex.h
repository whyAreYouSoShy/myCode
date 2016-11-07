//
//  UIColor+Hex.h
//  AiCheXiaoWu
//
//  Created by 袁国文 on 16/1/12.
//  Copyright © 2016年 YG.wen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HexColor(hex) [UIColor colorWithHexString:hex]
#define HexColorAlpha(hex,alpha) [UIColor colorWithHexString:hex AndAlpha:alpha]

@interface UIColor (Hex)
/**
 *  获取hexColor
 *
 *  @param color hex字符串
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
/**
 *  获取hexcolor并设置alpha
 *
 *  @param color hex字符串
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 *  获取hexcolor并设置alpha
 *
 *  @param color hex字符串
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color AndAlpha:(NSNumber *)alpha;
@end
