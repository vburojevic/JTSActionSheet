//
//  JTSActionSheetButton.h
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetItemView.h"

#import "JTSActionSheetItem.h"

@interface JTSActionSheetButton : JTSActionSheetItemView

@property (strong, nonatomic, readonly) JTSActionSheetItem *item;

- (instancetype)initWithItem:(JTSActionSheetItem *)item
                       theme:(JTSActionSheetTheme *)theme
                    position:(JTSActionSheetItemViewPosition)position;

@end
