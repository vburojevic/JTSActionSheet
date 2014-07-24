//
//  JTSActionSheetViewController.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetViewController.h"

#import "JTSActionSheet.h"
#import "JTSActionSheet_Protected.h"

@interface JTSActionSheetViewController ()

@property (strong, nonatomic) JTSActionSheet *sheet;
@property (strong, nonatomic) UIView *backdropShadowView;
@property (assign, nonatomic) BOOL sheetIsVisible;

@end

@implementation JTSActionSheetViewController

#pragma mark - Public

- (id)initWithActionSheet:(JTSActionSheet *)sheet {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _sheet = sheet;
        _sheet.autoresizingMask = UIViewAutoresizingNone;
    }
    return self;
}

- (void)playPresentationAnimation:(BOOL)animated {
    if (self.sheetIsVisible == NO) {
        self.sheetIsVisible = YES;
        UIViewAnimationOptions options = 7 << 16; // unpublished default curve
        CGFloat duration = (animated) ? 0.3 : 0;
        [UIView animateWithDuration:duration delay:0 options:options animations:^{
            self.sheet.transform = CGAffineTransformIdentity;
            self.backdropShadowView.alpha = 1;
        } completion:nil];
    }
}

- (void)playDismissalAnimation:(BOOL)animated completion:(void(^)(void))completion {
    if (self.sheetIsVisible == YES) {
        self.sheetIsVisible = NO;
        UIViewAnimationOptions options = 6 << 16; // unpublished default curve
        CGFloat duration = (animated) ? 0.3 : 0;
        [UIView animateWithDuration:duration delay:0 options:options animations:^{
            self.sheet.transform = CGAffineTransformMakeTranslation(0, self.sheet.bounds.size.height);
            self.backdropShadowView.alpha = 0;
        } completion:^(BOOL finished) {
            if (completion) {
                completion();
            }
        }];
    }
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.backdropShadowView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.backdropShadowView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.backdropShadowView.backgroundColor = self.sheet.theme.backdropShadowColor;
    self.backdropShadowView.alpha = 0;
    [self.view addSubview:self.backdropShadowView];
    
    [self.view addSubview:self.sheet];
    [self repositionSheet];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self repositionSheet];
}

#pragma mark - Private

- (void)repositionSheet {
    CGFloat actionSheetWidth = self.view.bounds.size.width;
    CGFloat actionSheetHeight = [self.sheet intrinsicHeightGivenAvailableWidth:actionSheetWidth];
    self.sheet.bounds = CGRectMake(0, 0, actionSheetWidth, actionSheetHeight);
    self.sheet.center = CGPointMake(roundf(actionSheetWidth / 2.0), roundf(self.view.bounds.size.height - actionSheetHeight / 2.0));
    if (self.sheetIsVisible) {
        self.sheet.transform = CGAffineTransformIdentity;
    } else {
        self.sheet.transform = CGAffineTransformMakeTranslation(0, actionSheetHeight);
    }
}

@end






