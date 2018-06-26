//
//  QLColorDefine.m
//  换肤功能Demo
//
//  Created by LJ on 2016/12/22.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import "QLColorDefine.h"
#import "ToolClass.h"
#import "QLThemeManager.h"
#define kCurrentTheme  [QLThemeManager shareThemeManager].Theme
#define kThemeColorItemLabel @"labelBgColor"
#define kThemeColorItemButton @"buttonBgColor"

@interface QLColorDefine ()
@end

@implementation QLColorDefine

// UILabel背景色
+ (UIColor* _Nonnull)defaultColorLabel {
    return [self colorWithThemeItem:kThemeColorItemLabel];
}

//UIButton背景色
+ (UIColor* _Nonnull)defaultColorButton {
    return [self colorWithThemeItem:kThemeColorItemButton];
}

+ (UIColor *)colorWithThemeItem:(NSString *)themeItem {
   
    // 1.获取plist的路径
    NSString *plistName = [NSString stringWithFormat:@"Theme/%@/bgColor.plist", kCurrentTheme];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
    
    // 2.读取颜色的点击
    NSDictionary *colorDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    // 3.读取对应颜色的字符串
    NSString *colorString = colorDict[themeItem];
    return [UIColor colorFromHexRGB:colorString];

}

@end
