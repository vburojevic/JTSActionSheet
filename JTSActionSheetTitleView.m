//
//  JTSActionSheetTitleView.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetTitleView.h"

#import "JTSActionSheetTheme.h"

@interface JTSActionSheetTitleView ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (copy, nonatomic) NSString *title;

@end

@implementation JTSActionSheetTitleView

#pragma mark - Public

- (instancetype)initWithTitle:(NSString *)title
                       theme:(JTSActionSheetTheme *)theme
                    position:(JTSActionSheetItemViewPosition)position {
    
    self = [super initWithTheme:theme position:position];
    if (self) {
        _title = title.copy;
    }
    return self;
}

- (CGFloat)intrinsicHeightGivenAvailableWidth:(CGFloat)availableWidth {
    return 0;
}

@end
