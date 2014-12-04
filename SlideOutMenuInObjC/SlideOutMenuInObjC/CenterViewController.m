//
//  CenterViewController.m
//  SlideOutMenuInObjC
//
//  Created by Joshua Winskill on 11/24/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(16, self.view.frame.size.height / 2, self.view.frame.size.width - 32, (self.view.frame.size.height / 2) - 10);
    Shape *shapeView = [[Shape alloc] initWithFrame:rect];
    [self.view addSubview:shapeView];
    
}

- (IBAction)didPressBurgerButton:(id)sender {
    if (self.delegate) {
        [self.delegate toggleMenu];
        NSLog(@"Delegate has been set");
    } else {
        NSLog(@"Delegate has not been set");
    }
    
}

@end
