//
//  JTSActionSheetButton.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetButton.h"

#import "JTSActionSheetTheme.h"
#import "JTSActionSheetImageUtility.h"

CGFloat const JTSActionSheetButtonHeight = 44.0;

@interface JTSActionSheetButton ()

@property (assign, nonatomic) BOOL isCancelItem;
@property (strong, nonatomic, readwrite) JTSActionSheetItem *item;
@property (strong, nonatomic) UIButton *button;

@end

@implementation JTSActionSheetButton

#pragma mark - Public

- (instancetype)initWithItem:(JTSActionSheetItem *)item
                isCancelItem:(BOOL)isCancelItem
                       theme:(JTSActionSheetTheme *)theme
                    position:(JTSActionSheetItemViewPosition)position {
    
    self = [super initWithTheme:theme position:position];
    if (self) {
        
        _item = item;
        _isCancelItem = isCancelItem;
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = self.bounds;
        UIFont *font = (isCancelItem) ? theme.boldButtonFont : theme.normalButtonFont;
        self.button.titleLabel.font = font;
        
        if (item.destructive) {
            [self.button setTitleColor:theme.destructiveButtonColor forState:UIControlStateNormal];
        } else {
            [self.button setTitleColor:theme.normalButtonColor forState:UIControlStateNormal];
        }
        
        UIImage *selectedImage = [JTSActionSheetImageUtility imageWithColor:[UIColor colorWithWhite:0 alpha:0.2]];
        [self.button setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
        
        [self.button setTitle:item.title forState:UIControlStateNormal];
        
        [self addSubview:self.button];
    }
    return self;
}

@end
