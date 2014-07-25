//
//  JTSActionSheetButton.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetButtonView.h"

#import "JTSActionSheetTheme.h"
#import "JTSActionSheetImageUtility.h"

// ---------------------------------------------------------------------------------
// A CUSTOM BUTTON
// ---------------------------------------------------------------------------------

@interface JTSActionSheetButton : UIButton

@property (assign, nonatomic) BOOL touchesInProgress;

@end

@implementation JTSActionSheetButton

- (void)setHighlighted:(BOOL)highlighted {
    BOOL valueChanged = (self.highlighted != highlighted);
    [super setHighlighted:highlighted];
    if (valueChanged && self.touchesInProgress) {
        [self.layer addAnimation:[CATransition animation] forKey:kCATransition];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    self.touchesInProgress = YES;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    self.touchesInProgress = NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    self.touchesInProgress = NO;
}


@end

// ---------------------------------------------------------------------------------
// BUTTON VIEW
// ---------------------------------------------------------------------------------

@interface JTSActionSheetButtonView ()

@property (weak, nonatomic) id <JTSActionSheetButtonViewDelegate> delegate;
@property (assign, nonatomic) BOOL isCancelItem;
@property (strong, nonatomic, readwrite) JTSActionSheetItem *item;
@property (strong, nonatomic) JTSActionSheetButton *button;

@end

@implementation JTSActionSheetButtonView

#pragma mark - Public

- (instancetype)initWithItem:(JTSActionSheetItem *)item
                isCancelItem:(BOOL)isCancelItem
                    delegate:(id <JTSActionSheetButtonViewDelegate>)delegate
                       theme:(JTSActionSheetTheme *)theme
                    position:(JTSActionSheetItemViewPosition)position {
    
    self = [super initWithTheme:theme position:position];
    if (self) {
        
        _delegate = delegate;
        _item = item;
        _isCancelItem = isCancelItem;
        
        self.button = [JTSActionSheetButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = self.bounds;
        UIFont *font = (isCancelItem) ? theme.boldButtonFont : theme.normalButtonFont;
        self.button.titleLabel.font = font;
        
        if (item.destructive) {
            [self.button setTitleColor:theme.destructiveButtonColor forState:UIControlStateNormal];
        } else {
            [self.button setTitleColor:theme.normalButtonColor forState:UIControlStateNormal];
        }
        
        UIImage *highlightedImage = [JTSActionSheetImageUtility imageWithColor:[UIColor colorWithWhite:0.0 alpha:0.09]];
        [self.button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
        
        [self.button addTarget:self action:@selector(buttonTouchedUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.button setTitle:item.title forState:UIControlStateNormal];
        
        [self addSubview:self.button];

    }
    return self;
}

#pragma mark - Button Actions

- (void)buttonTouchedUpInside:(id)sender {
    [self.delegate buttonViewWasSelected:self forItem:self.item];
}

@end



