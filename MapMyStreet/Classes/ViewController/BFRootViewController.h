//
//  BFRootViewController.h
//  MapMyStreet
//
//  Created by Vinay Chavan on 23/09/16.
//  Copyright © 2016 Bytefeast Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface BFRootViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
