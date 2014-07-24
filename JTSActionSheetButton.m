//
//  JTSActionSheetButton.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetButton.h"

#import "JTSActionSheetTheme.h"

CGFloat const JTSActionSheetButtonHeight = 44.0;

@interface JTSActionSheetButton ()

@property (assign, nonatomic) BOOL isCancelItem;
@property (strong, nonatomic, readwrite) JTSActionSheetItem *item;

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
    }
    return self;
}

@end
