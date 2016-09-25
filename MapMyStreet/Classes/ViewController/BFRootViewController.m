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

@interface BFRootViewController () <VCBaseDataSourceDelegate>
{
	BFDataPointDataSource *_dataSource;
}

@end

@implementation BFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	_dataSource = [[BFDataPointDataSource alloc] init];
	_dataSource.delegate = self;
	[_dataSource reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	[[BFDataPointManager sharedDataPointManager] startDataPointCollection];
	
	[self.mapView setRegion:MKCoordinateRegionMake(self.mapView.userLocation.location.coordinate,
												   MKCoordinateSpanMake(0.0009,
																		0.0009))
				   animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	
//	[[BFDataPointManager sharedDataPointManager] stopDataPointCollection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions

- (IBAction)didTapAddDataPoint:(id)sender
{
	[[BFDataPointManager sharedDataPointManager] registerDataPointManually:YES];
}


#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
	[mapView setCenterCoordinate:userLocation.location.coordinate
						animated:NO];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
//	MKCoordinateRegion region = mapView.region;
//	NSString *regionString = [NSString stringWithFormat:@"{{%f,%f},{%f,%f}}",
//							  region.center.latitude,
//							  region.center.longitude,
//							  region.span.latitudeDelta,
//							  region.span.longitudeDelta];
//	NSLog(@"%@", regionString);
	
	// update the region filter, fetch new annotations for adding into map for that region
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
	MKAnnotationView *annotationView = nil;
	if (annotation != mapView.userLocation) {
		static NSString * annotationViewIdentifier = @"annotationViewIdentifier";
		annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewIdentifier];
		if (annotationView == nil) {
			annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
														  reuseIdentifier:annotationViewIdentifier];
			annotationView.canShowCallout = NO;
		}
		
		if ([(BFDataPoint*)annotation manualEntry]) {
			annotationView.image = [UIImage imageNamed:@"bump_annotation_manual"];
		}else {
			annotationView.image = [UIImage imageNamed:@"bump_annotation_automatic"];
		}
	}
	return annotationView;
}

#pragma mark - ETBaseDataSourceDelegate

- (void)didFinishLoadingDataSource:(VCBaseEntityDataSource *)aDataSource
{
	NSLog(@"didFinishLoadingDataSource");
	
	NSArray *dataPoints = [[aDataSource fetchedResultsController] fetchedObjects];
	[self.mapView addAnnotations:dataPoints];
}

- (void)dataSource:(VCBaseEntityDataSource *)aDataSource didFailWithError:(NSError *)error
{
	NSLog(@"didFailWithError");
}

- (void)willBeginUpdatingDataSource:(VCBaseEntityDataSource *)aDataSource
{
	NSLog(@"willBeginUpdatingDataSource");
}

- (void)didFinishUpdateDataSource:(VCBaseEntityDataSource *)aDataSource
{
	NSLog(@"didFinishUpdateDataSource");
}

- (void)dataSource:(VCBaseEntityDataSource *)dataSource
   didChangeObject:(id)anObject
	   atIndexPath:(NSIndexPath *)indexPath
	 forChangeType:(NSFetchedResultsChangeType)type
	  newIndexPath:(NSIndexPath *)newIndexPath
{
	switch (type) {
			case NSFetchedResultsChangeInsert:
			[self.mapView addAnnotation:anObject];
			break;
			case NSFetchedResultsChangeDelete:
			break;
			case NSFetchedResultsChangeUpdate:
			// Configure the cell...
			break;
			case NSFetchedResultsChangeMove:
			break;
			
		default:
			break;
	}
}

- (void)dataSource:(VCBaseEntityDataSource *)dataSource didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
	switch(type) {
			case NSFetchedResultsChangeInsert:
			break;
			case NSFetchedResultsChangeDelete:
			break;
			case NSFetchedResultsChangeUpdate:
			break;
			
		default:
			break;
	}
}

@end
