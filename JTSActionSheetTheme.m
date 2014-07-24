//
//  JTSActionSheetTheme.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetTheme.h"

#define JTSDefaultActionColor [UIColor colorWithRed:0.09 green:0.50 blue:0.99 alpha:1.0]
#define JTSDefaultDesctructionColor [UIColor colorWithRed:0.99 green:0.24 blue:0.22 alpha:1.0]
#define JTSDefaultTitleColor [UIColor colorWithWhite:0.25 alpha:1.0]

@implementation JTSActionSheetTheme

/*
 UIKIT_EXTERN NSString *const UIFontTextStyleHeadline NS_AVAILABLE_IOS(7_0);
 UIKIT_EXTERN NSString *const UIFontTextStyleBody NS_AVAILABLE_IOS(7_0);
 UIKIT_EXTERN NSString *const UIFontTextStyleSubheadline NS_AVAILABLE_IOS(7_0);
 UIKIT_EXTERN NSString *const UIFontTextStyleFootnote NS_AVAILABLE_IOS(7_0);
 UIKIT_EXTERN NSString *const UIFontTextStyleCaption1 NS_AVAILABLE_IOS(7_0);
 UIKIT_EXTERN NSString *const UIFontTextStyleCaption2 NS_AVAILABLE_IOS(7_0);
 */

+ (instancetype)defaultTheme {
    JTSActionSheetTheme *theme = [[JTSActionSheetTheme alloc] init];
    theme.style = JTSActionSheetStyle_SolidColor;
    theme.titleFont = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    theme.normalButtonFont = [UIFont systemFontOfSize:17];
    theme.boldButtonFont = [UIFont boldSystemFontOfSize:17];
    theme.normalButtonColor = JTSDefaultActionColor;
    theme.destructiveButtonColor = JTSDefaultDesctructionColor;
    theme.titleColor = JTSDefaultTitleColor;
    theme.backdropShadowColor = [UIColor colorWithWhite:0 alpha:0.25];
    theme.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.95];
    return theme;
}

@end
