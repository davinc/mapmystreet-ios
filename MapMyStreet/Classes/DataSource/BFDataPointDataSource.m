//
//  BFDataPointDataSource.m
//  MapMyStreet
//
//  Created by Vinay Chavan on 25/09/16.
//  Copyright © 2016 Bytefeast Ltd. All rights reserved.
//

#import "BFDataPointDataSource.h"

#import "BFDataPointManager.h"

@implementation BFDataPointDataSource

- (instancetype)init
{
	self = [super initWithEntityName:@"DataPoint"];
	if (self) {
		NSManagedObjectContext *managedObjectContext = [[[BFDataPointManager sharedDataPointManager] coreDataStack] managedObjectContext];
		
//		NSPredicate *eventPredicate = [NSPredicate predicateWithFormat:@"eventId == %@", eventIdentifier];
		NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:YES];
		
		[self fetchWithPredicate:nil
				 sortDescriptors:@[sortDescriptor]
				  sectionKeyPath:nil
			managedObjectContext:managedObjectContext];
	}
	return self;
}

@end
