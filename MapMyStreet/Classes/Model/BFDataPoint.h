//
//  BFDataPoint.h
//  MapMyStreet
//
//  Created by Vinay Chavan on 25/09/16.
//  Copyright © 2016 Bytefeast Ltd. All rights reserved.
//

#import <CoreData/CoreData.h>

#import <MapKit/MapKit.h>

@interface BFDataPoint : NSManagedObject <MKAnnotation>

@property (nonatomic) double speed;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;
@property (nonatomic) double course;
@property (nonatomic) double altitude;
@property (nonatomic) double accelerationX;
@property (nonatomic) double accelerationY;
@property (nonatomic) double accelerationZ;
@property (nonatomic) double timestamp;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end
