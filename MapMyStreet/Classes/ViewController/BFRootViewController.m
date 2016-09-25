//
//  BFRootViewController.m
//  MapMyStreet
//
//  Created by Vinay Chavan on 23/09/16.
//  Copyright © 2016 Bytefeast Ltd. All rights reserved.
//

#import "BFRootViewController.h"

#import "BFDataPointManager.h"

@interface BFRootViewController ()

@end

@implementation BFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	[[BFDataPointManager sharedDataPointManager] startDataPointCollection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
