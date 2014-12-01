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
    self.menuShowing = NO;
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
    if (self.menuShowing == NO) {
        float rectWidth = CGRectGetWidth(self.navigationController.view.frame);
        NSLog(@"%f",rectWidth);
        [self animateCenterPanelXPosition:CGRectGetWidth(self.navigationController.view.frame) - 60 completionHandler:nil];
    } else if (self.menuShowing == YES) {
        NSLog(@"I am getting logged");
        [self animateCenterPanelXPosition:0 completionHandler:^(BOOL finished) {
        }];
    }
}

- (void)animateCenterPanelXPosition:(CGFloat)targetPosition completionHandler:(void(^)(BOOL finished))completionHandler {
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect newFrame = self.navigationController.view.frame;
        newFrame.origin.x = targetPosition;
        NSLog(@"The target position is: %f",targetPosition);
        [self.navigationController.view setFrame:newFrame];
    } completion:^(BOOL finished){
        if (finished) {
            NSLog(@"Behold, I am working");
            if (self.menuShowing == YES) {
                self.menuShowing = NO;
                [self.menuViewController.view removeFromSuperview];
                self.menuViewController = nil;
                return;
            }
            if (self.menuShowing == NO) {
                self.menuShowing = YES;
                return;
            }
        }
    }];
}

- (void)collapseMenu {
    
}

- (void)toggleMenu {
    if (self.menuShowing == NO) {
        [self addCustomMenuVC];
    }
    [self animateMenu:self.menuShowing];
}

@end
