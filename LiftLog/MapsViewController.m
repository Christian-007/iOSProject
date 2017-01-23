//
//  MapsViewController.m
//  LiftLog
//
//  Created by Christian Ing on 19/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "MapsViewController.h"

@interface MapsViewController ()

@end

@implementation MapsViewController

@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (locationManager == nil) {
        locationManager = [[CLLocationManager alloc]init];
        [locationManager requestAlwaysAuthorization];
        [locationManager requestWhenInUseAuthorization];
    }
    
    MKUserTrackingBarButtonItem *myLocationIcon = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapView];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    [barItems addObject:myLocationIcon];
    [self.customToolbar setItems:barItems animated:NO];
    
    self.mapView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

// Show nearby gyms using MKLocalSearchRequest
- (IBAction)showNearbyGyms:(id)sender {
    // Create a search request with a string
    MKLocalSearchRequest *localSearchRequest = [[MKLocalSearchRequest alloc] init];
    [localSearchRequest setNaturalLanguageQuery:@"Gym"];
    
    // Create the local search to perform the search
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:localSearchRequest];
    
    __block int totalGyms = 0;
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *searchResponse, NSError *error) {
        if (!error) {
            
            for (MKMapItem *mapItem in [searchResponse mapItems]) {
                
                NSLog(@"Name: %@, Placemark title: %@", [mapItem name], [[mapItem placemark] title]);
                NSLog(@"Coordinate: %f %f", [[mapItem placemark] coordinate].latitude, [[mapItem placemark] coordinate].longitude);
                
                [self addNearbyGymPins:mapItem];
                
            }
        } else {
            NSLog(@"Search Request Error: %@", [error localizedDescription]);
        }
        
        totalGyms = (int) searchResponse.mapItems.count;
        
        // Zoom out
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate, 2500, 2500);
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
        [self showTotalNearbyGymsAlert: totalGyms]; // show alert of total nearby gyms
    }];
}

- (IBAction)removePins:(id)sender {
    [self.mapView removeAnnotations:self.mapView.annotations];

}

// Display pins/annotations of gyms around the current user's location
- (void)addNearbyGymPins: (MKMapItem*)mapItem {
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake([[mapItem placemark] coordinate].latitude, [[mapItem placemark] coordinate].longitude);
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coord;
    point.title = [mapItem name];
    [self.mapView addAnnotation:point];
}

// Show alert of total nearby gyms
- (void)showTotalNearbyGymsAlert: (int)totalGyms{
    UIAlertController * alertController=   [UIAlertController alertControllerWithTitle:@"Lift Log Info: Nearby Gyms" message:[NSString stringWithFormat:@"There are %d gyms nearby you!", totalGyms] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action)
                         {
                             [alertController dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
