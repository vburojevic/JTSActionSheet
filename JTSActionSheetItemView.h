//
//  JTSActionSheetItemView.h
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

@import UIKit;

@class JTSActionSheetTheme;

typedef NS_ENUM(NSInteger, JTSActionSheetItemViewPosition) {
    JTSActionSheetItemViewPosition_Single,
    JTSActionSheetItemViewPosition_Top,
    JTSActionSheetItemViewPosition_Middle,
    JTSActionSheetItemViewPosition_Bottom,
};

@interface JTSActionSheetItemView : UIView

@property (strong, nonatomic, readonly) JTSActionSheetTheme *theme;
@property (assign, nonatomic, readonly) JTSActionSheetItemViewPosition position;

- (instancetype)initWithTheme:(JTSActionSheetTheme *)theme position:(JTSActionSheetItemViewPosition)position;

@end
