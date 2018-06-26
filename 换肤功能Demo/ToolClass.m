//
//  UIColor+ToolClass.m
//  QiQi
//
//  Created by macs on 15/4/1.
//  Copyright (c) 2015年 GuaGua. All rights reserved.
//

#import "ToolClass.h"
@implementation UIColor (ToolClass)

/*
 通过16进制计算颜色
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}

@end

@implementation NSString (branch)

- (NSString *)getStringCutSpace
{
    NSString *string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    return string;
}

- (BOOL) isContainString:(NSString *)tempString
{
    NSRange range=[self rangeOfString:tempString options:1];
    if(range.location!=NSNotFound){
        return true;
    }else{
        return false;
    }
}

-(NSString *)getCachePathString{
    if (!self) {
        return nil;
    }
    NSArray * firstArray = [self componentsSeparatedByString:@"http://hall.m.qxiu.com/"];
    NSArray * secArray;
    if (firstArray && firstArray.count) {
        secArray = [[firstArray lastObject] componentsSeparatedByString:@".do?"];
    }
    
    NSString * tmpPathString;
    if (secArray && secArray.count) {
        tmpPathString = [secArray firstObject];
    }
    NSArray * thridArray = [tmpPathString componentsSeparatedByString:@"/"];
    NSString * cachePath;
    if (thridArray && thridArray.count) {
        cachePath = [thridArray lastObject];
        return cachePath;
    }
    
    
    return nil;
}

-(NSUInteger)unicodeLengthOfString{
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < self.length; i++) {
        
        
        unichar uc = [self characterAtIndex: i];
        
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    return asciiLength;
}

-(NSUInteger)getIndexOfString{
    NSUInteger asciiLength = 0;
    if (self.length == 0) {
        return 0;
    }
    for (NSUInteger i = self.length - 1 ; i >= 0; i--) {
        
        
        unichar uc = [self characterAtIndex: i];
        
        asciiLength += isascii(uc) ? 1 : 2;
        if (asciiLength == 4 || asciiLength == 3) {
            return i;
        }
    }
    return 0;
}

+ (BOOL)stringContainsEmoji:(NSString *)string {
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}

@end

