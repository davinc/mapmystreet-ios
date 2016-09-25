//
//  BFDataPointManager.h
//  MapMyStreet
//
//  Created by Vinay Chavan on 24/09/16.
//  Copyright © 2016 Bytefeast Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 <#Description#>
 */
@interface BFDataPointManager : NSObject


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
