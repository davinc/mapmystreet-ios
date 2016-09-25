//
//  BFDataPointManager.h
//  MapMyStreet
//
//  Created by Vinay Chavan on 24/09/16.
//  Copyright © 2016 Bytefeast Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
#import <VCCoreDataStack/VCCoreDataStack.h>

/**
 <#Description#>
 */
@interface BFDataPointManager : NSObject

@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) VCCoreDataStack *coreDataStack;

/**
 <#Description#>

 @return <#return value description#>
 */
+ (instancetype)sharedDataPointManager;

/**
 <#Description#>
 */
- (void)startDataPointCollection;

/**
 <#Description#>
 */
- (void)stopDataPointCollection;

@end
