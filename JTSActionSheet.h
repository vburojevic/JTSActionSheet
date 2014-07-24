//
//  JTSActionSheet.h
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

@import UIKit;

#import "JTSActionSheetItem.h"
#import "JTSActionSheetTheme.h"

static inline JTSActionSheetItem * JTSActionSheetDefaultCancelItem(NSString *alternateCancelTitle) {
    NSString *title = nil;
    if (alternateCancelTitle) {
        title = alternateCancelTitle;
    } else {
        title = @"Cancel";
    }
    return [JTSActionSheetItem itemWithTitle:title action:nil isDestructive:NO];
}

@interface JTSActionSheet : UIView

@property (strong, nonatomic, readonly) JTSActionSheetTheme *theme;

- (instancetype)initWithTheme:(JTSActionSheetTheme *)theme
                        title:(NSString *)title
                  actionItems:(NSArray *)items
                   cancelItem:(JTSActionSheetItem *)cancelItem;

- (void)showInView:(UIView *)view;

@end
