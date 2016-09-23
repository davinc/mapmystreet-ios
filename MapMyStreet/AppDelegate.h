//
//  AppDelegate.h
//  MapMyStreet
//
//  Created by Vinay Chavan on 23/09/16.
//  Copyright © 2016 Bytefeast Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

