//
//  JTSActionSheetItemView.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetItemView.h"

#import "JTSActionSheetTheme.h"

@interface JTSActionSheetItemView ()

@property (strong, nonatomic, readwrite) JTSActionSheetTheme *theme;
@property (assign, nonatomic, readwrite) JTSActionSheetItemViewPosition position;

@end

@implementation JTSActionSheetItemView

#pragma mark - Public

- (instancetype)initWithTheme:(JTSActionSheetTheme *)theme position:(JTSActionSheetItemViewPosition)position {
    self = [super init];
    if (self) {
        _theme = theme;
        _position = position;
    }
    return self;
}

@end
