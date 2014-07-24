//
//  JTSActionSheet.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheet.h"
#import "JTSActionSheet_Protected.h"

#import "JTSActionSheetButton.h"
#import "JTSActionSheetTitleView.h"

CGFloat const JTSActionSheetMargin = 8.0f;

@interface JTSActionSheet ()

@property (strong, nonatomic, readwrite) JTSActionSheetTheme *theme;
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *actionItems;
@property (strong, nonatomic) JTSActionSheetItem *cancelItem;
@property (strong, nonatomic) JTSActionSheetTitleView *titleView;
@property (strong, nonatomic) NSArray *actionButtons;
@property (strong, nonatomic) JTSActionSheetButton *cancelButton;

@end

@implementation JTSActionSheet

#pragma mark - Public

- (instancetype)initWithTheme:(JTSActionSheetTheme *)theme
                        title:(NSString *)title
                  actionItems:(NSArray *)items
                   cancelItem:(JTSActionSheetItem *)cancelItem {
    
    self = [super init];
    if (self) {
        
        NSParameterAssert(theme);
        NSParameterAssert(items.count);
        NSParameterAssert(cancelItem);
        
        if (title.length) {
            _title = title.copy;
            _titleView = [[JTSActionSheetTitleView alloc] initWithTitle:title theme:theme position:JTSActionSheetItemViewPosition_Top];
        }
        
        _actionItems = items.copy;
        _actionButtons = [self actionButtonsForItems:items theme:theme titleWillBeUsed:(_title != nil)];
        
        _cancelItem = cancelItem;
        _cancelButton = [[JTSActionSheetButton alloc] initWithItem:cancelItem isCancelItem:YES theme:theme position:JTSActionSheetItemViewPosition_Single];
    }
    return self;
}

#pragma mark - UIView

- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGFloat cursor = self.bounds.size.height;
    CGRect buttonBounds = CGRectMake(JTSActionSheetMargin, 0, self.bounds.size.width - JTSActionSheetMargin/2.0f, JTSActionSheetButtonHeight);
    
    // CANCEL BUTTON
    CGRect cancelFrame = buttonBounds;
    cancelFrame.origin.x = JTSActionSheetMargin;
    cancelFrame.origin.y = cursor - JTSActionSheetMargin - buttonBounds.size.height;
    self.cancelButton.frame = cancelFrame;
    
    // GAP BETWEEN CANCEL BUTTON AND ACTION BUTTONS
    cursor = cancelFrame.origin.y - JTSActionSheetMargin;
    
    // GAP BETWEEN EACH ACTION BUTTON
    CGFloat gap = 1.0f / [UIScreen mainScreen].scale;
    
    // FRAME FOR EACH ACTION BUTTON
    for (JTSActionSheetButton *button in self.actionButtons) {
        CGRect buttonFrame = buttonBounds;
        buttonFrame.origin.y = cursor - buttonBounds.size.height;
        button.frame = buttonFrame;
        if (self.actionButtons.lastObject != button) {
            cursor -= gap;
        }
    }
    
    // TITLE VIEW
    if (self.titleView) {
        cursor -= JTSActionSheetMargin;
        CGRect titleViewRect = CGRectZero;
        CGFloat titleViewWidth = buttonBounds.size.width;
        titleViewRect.size.width = titleViewWidth;
        titleViewRect.size.height = [self.titleView intrinsicHeightGivenAvailableWidth:titleViewWidth];
        titleViewRect.origin.x = buttonBounds.origin.x;
        titleViewRect.origin.y = cursor - titleViewRect.size.height;
        self.titleView.frame = titleViewRect;
    }
}

- (CGFloat)intrinsicHeightGivenAvailableWidth:(CGFloat)availableWidth {
    
    CGFloat totalHeight = 0;
    
    CGRect buttonBounds = CGRectMake(JTSActionSheetMargin, 0, self.bounds.size.width - JTSActionSheetMargin/2.0f, JTSActionSheetButtonHeight);
    CGFloat gap = 1.0f / [UIScreen mainScreen].scale;

    // bottom gap plus cancel button
    totalHeight += JTSActionSheetMargin + buttonBounds.size.height;
    
    // gap between cancel button and action buttons
    totalHeight += JTSActionSheetMargin;
    
    // action buttons
    totalHeight += buttonBounds.size.height * self.actionButtons.count + gap * self.actionButtons.count-1;
    
    // title view
    if (self.titleView) {
        totalHeight += JTSActionSheetMargin;
        CGRect titleViewRect = CGRectZero;
        CGFloat titleViewWidth = buttonBounds.size.width;
        titleViewRect.size.width = titleViewWidth;
        titleViewRect.size.height = [self.titleView intrinsicHeightGivenAvailableWidth:titleViewWidth];
        totalHeight += titleViewRect.size.height;
    }
    
    return totalHeight;
}

#pragma mark - Private

- (NSArray *)actionButtonsForItems:(NSArray *)items theme:(JTSActionSheetTheme *)theme titleWillBeUsed:(BOOL)titleWillBeUsed {
    
    NSAssert(items.count, @"JTSActionSheet requires at least one action item.");
    
    NSMutableArray *buttons = [NSMutableArray array];
    NSInteger ajdustedButtonCount = items.count;
    
    for (NSInteger index; index < buttons.count; index++) {
        NSInteger adjustedIndex = (titleWillBeUsed) ? index + 1 : index;
        JTSActionSheetItemViewPosition position = [self positionForIndex:adjustedIndex totalCount:ajdustedButtonCount];
        JTSActionSheetItem *item = items[index];
        JTSActionSheetButton *newButton = [[JTSActionSheetButton alloc] initWithItem:item isCancelItem:NO theme:theme position:position];
        [buttons addObject:newButton];
    }
    
    return buttons;
}

- (JTSActionSheetItemViewPosition)positionForIndex:(NSInteger)index totalCount:(NSInteger)totalCount {
    
    JTSActionSheetItemViewPosition position;
    
    if (totalCount == 1) {
        position = JTSActionSheetItemViewPosition_Single;
    }
    else {
        if (index == 0) {
            position = JTSActionSheetItemViewPosition_Top;
        }
        else if (index == totalCount-1) {
            position = JTSActionSheetItemViewPosition_Bottom;
        }
        else {
            position = JTSActionSheetItemViewPosition_Middle;
        }
    }
    
    return position;
}

@end















