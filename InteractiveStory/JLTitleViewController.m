//
//  JLTitleViewController.m
//  InteractiveStory
//
//  Created by Johnny Lee on 11/27/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import "JLTitleViewController.h"

@interface JLTitleViewController ()
- (IBAction)startAction:(id)sender;

@end

@implementation JLTitleViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (IBAction)startAction:(id)sender
{
    [self performSegueWithIdentifier:@"Start Picking" sender:self];
}
@end
