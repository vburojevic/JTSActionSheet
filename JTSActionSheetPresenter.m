//
//  JTSActionSheetPresenter.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetPresenter.h"

#import "JTSActionSheet.h"
#import "JTSActionSheetViewController.h"

@implementation JTSActionSheetPresenter

#pragma mark - Public

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static JTSActionSheetPresenter * sharedInstance;
    dispatch_once(&once, ^ { sharedInstance = [[self alloc] init]; });
    return sharedInstance;
}

- (void)presentSheet:(JTSActionSheet *)sheet fromView:(UIView *)view {
    
    UIWindow *window = view.window;
    UIViewController *rootVC = window.rootViewController;
    NSAssert(rootVC, @"JTSActionSheet must be presented from a view with a window with a root view controller.");
    
    JTSActionSheetViewController *actionSheetViewController = [[JTSActionSheetViewController alloc] initWithActionSheet:sheet];
    actionSheetViewController.view.frame = rootVC.view.frame;
    actionSheetViewController.view.transform = rootVC.view.transform;
    [rootVC.view.superview addSubview:actionSheetViewController.view];
    
    
}

#pragma mark - Private

@end
