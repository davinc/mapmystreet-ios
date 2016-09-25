//
//  BFRootViewController.m
//  MapMyStreet
//
//  Created by Vinay Chavan on 23/09/16.
//  Copyright © 2016 Bytefeast Ltd. All rights reserved.
//

#import "BFRootViewController.h"

#import "BFDataPointManager.h"

#import "BFDataPointDataSource.h"

@interface BFRootViewController ()



@end

@implementation BFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
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


#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
	[mapView setRegion:MKCoordinateRegionMake(userLocation.location.coordinate,
											  MKCoordinateSpanMake(0.005,
																   0.005))
			  animated:YES];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	MKCoordinateRegion region = mapView.region;
	NSString *regionString = [NSString stringWithFormat:@"{{%f,%f},{%f,%f}}",
							  region.center.latitude,
							  region.center.longitude,
							  region.span.latitudeDelta,
							  region.span.longitudeDelta];
	NSLog(@"%@", regionString);
	
	// update the region filter, fetch new annotations for adding into map for that region
}

@end
