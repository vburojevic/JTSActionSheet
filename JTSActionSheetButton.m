//
//  JTSActionSheetButton.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetButton.h"

#import "JTSActionSheetTheme.h"

@interface JTSActionSheetButton ()

@property (strong, nonatomic, readwrite) JTSActionSheetItem *item;

@end

@implementation JTSActionSheetButton

#pragma mark - Public

- (instancetype)initWithItem:(JTSActionSheetItem *)item
                       theme:(JTSActionSheetTheme *)theme
                    position:(JTSActionSheetItemViewPosition)position {
    
    self = [super initWithTheme:theme position:position];
    if (self) {
        _item = item;
    }
    return self;
}

@end
