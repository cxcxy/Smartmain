//
//  NSObject+Extension.h
//  FQC_User
//
//  Created by Adinnet_Mac on 2017/4/27.
//  Copyright © 2017年 YangLiang. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface NSObject (HUD)

- (void)showHint:(NSString *)hint;

- (void)showHint:(NSString *)hint afterDelay:(int )delay;

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

@end
