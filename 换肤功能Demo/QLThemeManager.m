//
//  QLThemeManager.m
//  换肤功能Demo
//
//  Created by LJ on 2016/12/21.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import "QLThemeManager.h"
#define kThemeChangedNotification @"ThemeChangedNotification"


@implementation QLThemeManager

- (instancetype)init {
    if(self = [super init]) {
        //设置默认主题
        _Theme =  [[NSUserDefaults standardUserDefaults] objectForKey:@"Theme"];
        if (_Theme == nil) {
            _Theme = @"blue";
        }
    }
    return self;
}
+ (QLThemeManager*) shareThemeManager {
    static QLThemeManager *shareManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager ;
}

/**
 重写Theme的set方法，改变Theme时要发送通知，使得其他控制器能够同步。
 @param Theme 主题
 */
- (void)setTheme:(NSString *)Theme {
    if ([Theme isEqualToString:_Theme]) {
        return;
    }
    _Theme = Theme;
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeChangedNotification object:nil];
    //数据持久化
    [[NSUserDefaults standardUserDefaults] setObject:_Theme forKey:@"Theme"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


/**
 获取相应主题下的背景图片

 @param imageName 图片名称
 @return 相应主题下的背景图片
 */
- (UIImage *)ThemeWithImageName:(NSString *)imageName {
    NSString *imagePath = [NSString stringWithFormat:@"Theme/%@/%@", _Theme ,imageName];
    return [UIImage imageNamed:imagePath];
}

@end
