//
//  MenuViewController.m
//  SlideOutMenuInObjC
//
//  Created by Joshua Winskill on 11/24/14.
//  Copyright (c) 2014 Joshua Winskill. All rights reserved.
//

#import "MenuViewController.h"

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewControllersArray = @[@"Blue",@"Green",@"Purple",@"Ebony",@"Ivory"];
    
    [self setUpTableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"CELL";
    
    [tableView registerClass:[MenuCell class] forCellReuseIdentifier:reuseIdentifier];
    
    MenuCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.viewControllersArray[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewControllersArray.count;
}

- (void)setUpTableView {
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    
    NSDictionary *tableViewDictionary = @{@"tableView" : self.tableView};
    NSDictionary *metrics = @{@"vSpacingTop" : @20, @"vSpacingBottom" : @0, @"hSpacing" : @0};

    // Add constraints for tableView size
    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacingTop-[tableView]-vSpacingBottom-|"
                                                                    options:0
                                                                    metrics:metrics
                                                                      views:tableViewDictionary];
    
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpacing-[tableView]-hSpacing-|"
                                                                    options:0
                                                                    metrics:metrics
                                                                      views:tableViewDictionary];
    [self.view addConstraints:constraint_V];
    [self.view addConstraints:constraint_H];
    
    // Add constraints for tableView position
//    NSArray *constraint_Top = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[tableView]"
//                                                                      options:0
//                                                                      metrics:nil
//                                                                        views:tableViewDictionary];
//    
//    NSArray *constraint_Bottom = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[tableView]-|"
//                                                                         options:0
//                                                                         metrics:nil
//                                                                           views:tableViewDictionary];
//    
//    NSArray *constraint_Leading = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[tableView]"
//                                                                          options:0
//                                                                          metrics:nil
//                                                                            views:tableViewDictionary];
//    
//    NSArray *constraint_Trailing = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[tableView]-|"
//                                                                           options:0
//                                                                           metrics:nil
//                                                                             views:tableViewDictionary];
//    
//    [self.view addConstraints:constraint_Top];
//    [self.view addConstraints:constraint_Bottom];
//    [self.view addConstraints:constraint_Leading];
//    [self.view addConstraints:constraint_Trailing];
//    
}


@end
