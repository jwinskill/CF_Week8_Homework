//
//  MenuCell.m
//  SlideOutMenuInObjC
//
//  Created by Joshua Winskill on 12/3/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
