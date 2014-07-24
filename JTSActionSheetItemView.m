//
//  JTSActionSheetItemView.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetItemView.h"

#import "JTSActionSheetTheme.h"

CGFloat const JTSActionSheetItemViewCornerRadius = 4.0f;

@interface JTSActionSheetItemView ()

@property (strong, nonatomic, readwrite) JTSActionSheetTheme *theme;
@property (assign, nonatomic, readwrite) JTSActionSheetItemViewPosition position;
@property (strong, nonatomic) UIToolbar *blurringBar;

@end

@implementation JTSActionSheetItemView

#pragma mark - Public

- (instancetype)initWithTheme:(JTSActionSheetTheme *)theme position:(JTSActionSheetItemViewPosition)position {
    self = [super initWithFrame:CGRectMake(0, 0, 304, 44)];
    if (self) {
        self.clipsToBounds = YES;
        _theme = theme;
        _position = position;
        if (theme.style == JTSActionSheetStyle_WhiteBlurred) {
            self.blurringBar = [[UIToolbar alloc] initWithFrame:CGRectInset(self.bounds, -1, -1)];
            self.blurringBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            self.blurringBar.barStyle = UIBarStyleDefault;
            [self addSubview:self.blurringBar];
        }
        else if (theme.style == JTSActionSheetStyle_DarkBlurred) {
            self.blurringBar = [[UIToolbar alloc] initWithFrame:CGRectInset(self.bounds, -1, -1)];
            self.blurringBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            self.blurringBar.barStyle = UIBarStyleBlack;
            [self addSubview:self.blurringBar];
        }
        else {
            self.backgroundColor = theme.backgroundColor;
        }
    }
    return self;
}

#pragma mark - UIView

- (void)setFrame:(CGRect)frame {
    BOOL clippingMaskIsDirty = (frame.size.width != self.bounds.size.width);
    [super setFrame:frame];
    if (clippingMaskIsDirty && self.position != JTSActionSheetItemViewPosition_Middle) {
        UIRectCorner corners = [self cornerClipForPosition:self.position];
        CGSize radii = CGSizeMake(JTSActionSheetItemViewCornerRadius, JTSActionSheetItemViewCornerRadius);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
        CAShapeLayer *clipper = [[CAShapeLayer alloc] init];
        clipper.frame = self.bounds;
        clipper.path = path.CGPath;
        self.layer.mask = clipper;
    }
}

#pragma mark - Private

- (UIRectCorner)cornerClipForPosition:(JTSActionSheetItemViewPosition)position {
    
    UIRectCorner corners;
    
    switch (position) {
        case JTSActionSheetItemViewPosition_Single:
            corners = UIRectCornerAllCorners;
            break;
        case JTSActionSheetItemViewPosition_Top:
            corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case JTSActionSheetItemViewPosition_Middle:
            NSLog(@"[%@ cornerClipForPosition:] - Warning! Do not round corners for the middle position.", NSStringFromClass([self class]));
            break;
        case JTSActionSheetItemViewPosition_Bottom:
            corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
            
        default:
            break;
    }
    
    return corners;
}

@end
