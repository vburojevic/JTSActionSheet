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

@interface JTSActionSheet : UIView

- (instancetype)initWithTheme:(JTSActionSheetTheme *)theme
                        title:(NSString *)title
                  actionItems:(NSArray *)items
                   cancelItem:(JTSActionSheetItem *)cancelItem;

@end
