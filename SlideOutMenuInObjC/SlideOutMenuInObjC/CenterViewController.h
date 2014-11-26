//
//  CenterViewController.h
//  SlideOutMenuInObjC
//
//  Created by Joshua Winskill on 11/24/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CenterViewControllerDelegate.h"

@interface CenterViewController : UIViewController

@property (weak, nonatomic) id<CenterViewControllerDelegate> delegate;

- (IBAction)didPressBurgerButton:(id)sender;

@end
