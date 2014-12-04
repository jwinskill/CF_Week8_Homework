//
//  Shape.m
//  SlideOutMenuInObjC
//
//  Created by Joshua Winskill on 12/4/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "Shape.h"

@implementation Shape


- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:8.0];
    path.lineWidth = 10.0;
    
    [[UIColor blueColor] setStroke];
    [[UIColor yellowColor] setFill];
    
    [path fill];
    [path stroke];
}


@end
