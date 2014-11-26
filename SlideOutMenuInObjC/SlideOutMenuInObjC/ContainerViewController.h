//
//  ContainerViewController.h
//  SlideOutMenuInObjC
//
//  Created by Joshua Winskill on 11/24/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CenterViewController.h"
#import "CenterViewControllerDelegate.h"
#import "MenuViewController.h"

@interface ContainerViewController : UIViewController <CenterViewControllerDelegate>

@property bool menuShowing;
@property (strong, nonatomic) CenterViewController *centerViewController;
@property (strong, nonatomic) MenuViewController *menuViewController;
@property (strong, nonatomic) UINavigationController *navigationController;

- (void)addCustomMenuVC;
- (void)animateMenu:(bool) shouldShow;
- (void)animateCenterPanelXPosition:(CGFloat)targetPosition completionHandler:(void(^)(bool nilValue))completionHandler;

@end
