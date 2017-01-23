//
//  MapsViewController.h
//  LiftLog
//
//  Created by Christian Ing on 19/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapsViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)showNearbyGyms:(id)sender;
- (IBAction)removePins:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *customToolbar;

@end
