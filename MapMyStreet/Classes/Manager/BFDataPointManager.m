//
//  BFDataPointManager.m
//  MapMyStreet
//
//  Created by Vinay Chavan on 24/09/16.
//  Copyright © 2016 Bytefeast Ltd. All rights reserved.
//

#import "BFDataPointManager.h"

#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

@interface BFDataPointManager () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CMMotionManager *motionManager;

@property (nonatomic, strong) CLLocation *currentLocation;

@end

@implementation BFDataPointManager

+ (instancetype)sharedDataPointManager
{
	static BFDataPointManager *_sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedInstance = [[BFDataPointManager alloc] init];
	});
	
	return _sharedInstance;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.locationManager = [[CLLocationManager alloc] init];
		[self.locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
		[self.locationManager setDelegate:self];
		
		self.motionManager = [[CMMotionManager alloc] init];
		[self.motionManager setAccelerometerUpdateInterval:0.2];

	}
	return self;
}


#pragma mark - Public

- (void)startDataPointCollection
{
	[self requestAuthorizationIfRequired];
	
	[self.locationManager startUpdatingLocation];
	[self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue]
											withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
												if (fabs(motion.userAcceleration.x) > 1.5f ||
													fabs(motion.userAcceleration.y) > 1.5f ||
													fabs(motion.userAcceleration.z) > 1.5f) {
													NSLog(@"Bump Detected at %@", self.currentLocation);
												}
											}];
}

- (void)stopDataPointCollection
{
	[self.locationManager stopUpdatingLocation];
	[self.motionManager stopDeviceMotionUpdates];
}



#pragma mark - Private

- (void)requestAuthorizationIfRequired
{
	if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
		[self.locationManager requestWhenInUseAuthorization];
	}

	if ([self.motionManager isAccelerometerAvailable]) {
	}
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations
{
	self.currentLocation = [locations lastObject];
}

@end
