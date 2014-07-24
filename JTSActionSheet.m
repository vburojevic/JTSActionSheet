//
//  JTSActionSheet.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheet.h"

#import "JTSActionSheetButton.h"
#import "JTSActionSheetTitleView.h"

@interface JTSActionSheet ()

@property (strong, nonatomic) JTSActionSheetTheme *theme;
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
        //
    }
    return self;
}

#pragma mark - Private

- (NSArray *)actionButtonsForItems:(NSArray *)items theme:(JTSActionSheetTheme *)theme titleWillBeUsed:(BOOL)titleWillBeUsed {
    
    NSAssert(items.count, @"JTSActionSheet requires at least one action item.");
    
    NSMutableArray *buttons = [NSMutableArray array];
    NSInteger ajdustedButtonCount = items.count;
    
    for (NSInteger index; index < buttons.count; index++) {
        NSInteger adjustedIndex = (titleWillBeUsed) ? index + 1 : index;
        JTSActionSheetItemViewPosition position = [self positionForIndex:adjustedIndex totalCount:ajdustedButtonCount];
        JTSActionSheetButton *newButton = [[JTSActionSheetButton alloc] initWithTheme:theme position:position];
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















