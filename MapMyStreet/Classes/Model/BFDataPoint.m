//
//  BFDataPoint.m
//  MapMyStreet
//
//  Created by Vinay Chavan on 25/09/16.
//  Copyright © 2016 Bytefeast Ltd. All rights reserved.
//

#import "BFDataPoint.h"

@implementation BFDataPoint

@dynamic speed;
@dynamic longitude;
@dynamic latitude;
@dynamic course;
@dynamic altitude;
@dynamic accelerationX;
@dynamic accelerationY;
@dynamic accelerationZ;
@dynamic timestamp;

- (CLLocationCoordinate2D)coordinate
{
	return CLLocationCoordinate2DMake(self.latitude,
									  self.longitude);
}

@end
