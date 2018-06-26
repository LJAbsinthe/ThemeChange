//
//  ViewController.m
//  换肤功能Demo
//
//  Created by LJ on 2016/12/21.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import "ViewController.h"
#import "QLThemeManager.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rectImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [self reloadTheme];
}
- (IBAction)blue:(id)sender {
    [QLThemeManager shareThemeManager].Theme = @"blue";
    [self reloadTheme];

}

- (IBAction)green:(id)sender {
    [QLThemeManager shareThemeManager].Theme = @"green";
    [self reloadTheme];

}

- (IBAction)red:(id)sender {
    [QLThemeManager shareThemeManager].Theme = @"red";
    [self reloadTheme];

}

-(void)reloadTheme{
    
    self.faceImageView.image = [[QLThemeManager shareThemeManager] ThemeWithImageName:@"face"];
    self.heartImageView.image = [[QLThemeManager shareThemeManager] ThemeWithImageName:@"heart"];
    self.rectImageView.image = [[QLThemeManager shareThemeManager] ThemeWithImageName:@"rect"];
}
@end
