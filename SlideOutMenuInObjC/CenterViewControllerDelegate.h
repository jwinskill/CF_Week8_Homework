//
//  CenterViewControllerDelegate.h
//  SlideOutMenuInObjC
//
//  Created by Joshua Winskill on 11/24/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CenterViewController.h"

@protocol CenterViewControllerDelegate <NSObject>

- (void) toggleMenu;

@end
