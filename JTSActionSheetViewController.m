//
//  JTSActionSheetViewController.m
//  Time Zones
//
//  Created by Jared Sinclair on 7/24/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

#import "JTSActionSheetViewController.h"

#import "JTSActionSheet.h"

@interface JTSActionSheetViewController ()

@property (strong, nonatomic) JTSActionSheet *sheet;

@end

@implementation JTSActionSheetViewController

#pragma mark - Public

- (id)initWithActionSheet:(JTSActionSheet *)sheet {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _sheet = sheet;
    }
    return self;
}

- (void)playPresentationAnimation:(BOOL)animated {
    
}

- (void)playDismissalAnimation:(BOOL)animated {
    
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end






