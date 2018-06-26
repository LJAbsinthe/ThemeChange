//
//  SecondViewController.m
//  换肤功能Demo
//
//  Created by LJ on 2016/12/21.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import "SecondViewController.h"
#import "QLThemeManager.h"
#import "QLColorDefine.h"
#define kThemeChangedNotification @"ThemeChangedNotification"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rectImageView;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation SecondViewController
- (void)viewDidLoad {
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChangedNotfication) name:kThemeChangedNotification object:nil];
    [self reloadTheme];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


-(void)themeChangedNotfication {
    [self reloadTheme];
}

-(void)reloadTheme {
    self.faceImageView.image = [[QLThemeManager shareThemeManager] ThemeWithImageName:@"face"];
    self.heartImageView.image = [[QLThemeManager shareThemeManager] ThemeWithImageName:@"heart"];
    self.rectImageView.image = [[QLThemeManager shareThemeManager] ThemeWithImageName:@"rect"];
    self.testLabel.backgroundColor = [QLColorDefine defaultColorLabel];

}
@end
