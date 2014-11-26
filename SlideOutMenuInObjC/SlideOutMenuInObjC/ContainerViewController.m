//
//  ContainerViewController.m
//  SlideOutMenuInObjC
//
//  Created by Joshua Winskill on 11/24/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.centerViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"CENTER_VC"];
    self.centerViewController.delegate = self;
    
    // wrap the centerViewController in a navigation controller, so we can push views to it
    // and display bar button items in the navigation bar
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.centerViewController];
    [self.view addSubview:self.navigationController.view];
    [self addChildViewController:self.navigationController];
    
    [self.navigationController didMoveToParentViewController:self];
}

- (void)addCustomMenuVC {
    if (!self.menuViewController) {
        self.menuViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"MENU_VC"];
        [self.view insertSubview:self.menuViewController.view atIndex:0];
        
        [self addChildViewController:self.menuViewController];
        [self.menuViewController didMoveToParentViewController:self];
    }
}

- (void)animateMenu:(bool) menuShowing{
    if (!menuShowing) {
        self.menuShowing = true;
        float rectWidth = CGRectGetWidth(self.navigationController.view.frame);
        NSLog(@"%f",rectWidth);
        [self animateCenterPanelXPosition:CGRectGetWidth(self.navigationController.view.frame) - 60 completionHandler:nil];
    } else {
        [self animateCenterPanelXPosition:0 completionHandler:^(bool nilValue) {
            self.menuShowing = false;
            [self.menuViewController.view removeFromSuperview];
            self.menuViewController = nil;
        }];
    }
}

- (void)animateCenterPanelXPosition:(CGFloat)targetPosition completionHandler:(void(^)(bool nilValue))completionHandler {
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect newFrame = self.navigationController.view.frame;
        newFrame.origin.x = targetPosition;
        NSLog(@"%f",targetPosition);
        [self.navigationController.view setFrame:newFrame];
    } completion:nil];
}

- (void)collapseMenu {
    
}

- (void)toggleMenu {
    if (!self.menuShowing) {
        [self addCustomMenuVC];
    }
    [self animateMenu:self.menuShowing];
}

@end
