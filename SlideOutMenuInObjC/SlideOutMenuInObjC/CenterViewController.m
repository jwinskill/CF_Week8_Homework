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
