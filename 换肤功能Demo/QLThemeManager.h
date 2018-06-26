//
//  QLThemeManager.h
//  换肤功能Demo
//
//  Created by LJ on 2016/12/21.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QLThemeManager : NSObject

@property (nonatomic,copy) NSString *Theme;

+ (instancetype)shareThemeManager;

- (UIImage *)ThemeWithImageName:(NSString *)imageName;


@end
