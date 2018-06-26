//
//  UIColor+ToolClass.h
//  QiQi
//
//  Created by macs on 15/4/1.
//  Copyright (c) 2015年 GuaGua. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KBASE_PATH_REQUEST @"RequestData"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


@interface UIColor (ToolClass)
/*
 通过16进制计算颜色
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;
@end


@interface NSString (branch)

- (NSString *)getStringCutSpace;
- (BOOL) isContainString:(NSString *)tempString;

/**
 *  为了缓存用的，临时方法
 */

-(NSString *)getCachePathString;

/**
 *  返回字符串长度
 *  @return 字符串所占的长度
 */
-(NSUInteger)unicodeLengthOfString;


-(NSUInteger)getIndexOfString;
/**
 *  判断字符串是否是表情
 *
 *  @param string
 *
 *  @return 
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;//
@end

@interface UINavigationBar (BackgroundColor)
-(void)customSetBackgroundColor:(UIColor *)backgroundColor;
@end

