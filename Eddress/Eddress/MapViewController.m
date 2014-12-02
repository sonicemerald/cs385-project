//
//  MapViewController.m
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import "MapViewController.h"
#import "CustomAnnotation.h"
#import "FMDatabase.h"
#import "QuickAddViewController.h"

@interface MapViewController ()

@property (nonatomic) UISegmentedControl *mapTypeSegCtl;
@property (nonatomic) UISegmentedControl *mapLocationSegCtl;
@property (nonatomic) MKMapView *mapView;
@property (nonatomic) NSString *latitude;
@property (nonatomic) NSString *longitude;
@property (nonatomic) QuickAddViewController *quickAdd;


-(void) setMapType: (id) sender;
-(void) setMapLocation: (id) sender;
-(UISegmentedControl *) makeSegmentedControl: (NSArray *) labels withY: (NSInteger) yValue;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CoreLocation Stuff
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = 10;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        //[locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];

    
    //Map Stuff
    CGRect bounds = [[UIScreen mainScreen] applicationFrame];
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, bounds.size.height-29)];
    self.mapView.delegate = self;
    [self.view insertSubview:self.mapView atIndex:0];
    self.mapView.showsUserLocation = YES; //If set, will track location of device
    
    self.mapView.mapType = MKMapTypeStandard;

    
}

- (void)callQuickAdd:(id)sender
{
    NSLog(@"You are here");
    self.quickAdd = [[QuickAddViewController alloc] initWithLatitude:self.latitude andLongitude:self.longitude];
    

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"quickAddSB"];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:NULL];
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static int i = 0;
    NSString *reuseID = [NSString stringWithFormat: @"pinAnnotation%d", i];
    i++;
    MKPinAnnotationView* pinView = (MKPinAnnotationView *)
    [self.mapView dequeueReusableAnnotationViewWithIdentifier: reuseID];
    
    if( ! pinView ) {
        pinView = [[MKPinAnnotationView alloc]
                   initWithAnnotation:annotation reuseIdentifier: reuseID];
        if( [annotation isKindOfClass:[CustomAnnotation class]] )
            pinView.pinColor = MKPinAnnotationColorGreen; // pin color and other configurations.
        else
            pinView.pinColor = MKPinAnnotationColorRed;
        pinView.animatesDrop = NO;
        pinView.canShowCallout = YES;
        if( [annotation isKindOfClass: [CustomAnnotation class]] ) {  // call quick add
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(callQuickAdd:)
                  forControlEvents:UIControlEventTouchUpInside];
            pinView.rightCalloutAccessoryView = rightButton;
            
        }
    } else {
        pinView.annotation = annotation;
    }
    return pinView;
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    UIAlertView *errorAltert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAltert show];
    NSLog(@"Error: %@", error.description);
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"didUpdateLocaiton");
    CLLocation *location = [locations lastObject];
    self.latitude = [NSString stringWithFormat:@"%.8f", location.coordinate.latitude];
    self.longitude = [NSString stringWithFormat:@"%.8f", location.coordinate.longitude];
    NSLog(@"lat:%@", self.latitude);
    NSLog(@"long:%@", self.longitude);
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = [self.latitude doubleValue];
    newRegion.center.longitude = [self.longitude doubleValue];
    newRegion.span.latitudeDelta = 0.5;
    newRegion.span.longitudeDelta = 0.5;
    [self.mapView setRegion:newRegion];


    //Pin Stuff
    CustomAnnotation *annotation = [[CustomAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
    annotation.title = @"You are here!";
    
    [self.mapView addAnnotation:annotation];
}



-(UISegmentedControl *) makeSegmentedControl:(NSArray *)labels withY:(NSInteger)yValue
{
    if ( [labels count] == 0)
        return nil;
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:labels];
    segmentedControl.tintColor = [UIColor blackColor];
    segmentedControl.momentary = YES;
    segmentedControl.alpha = 1.0;
    CGRect segBounds = segmentedControl.bounds;
    CGRect screenBounds = [[UIScreen mainScreen] applicationFrame];
    segmentedControl.frame = CGRectMake( (screenBounds.size.width - segBounds.size.width) / 2.0 + 15, yValue, segBounds.size.width * 0.9, 2.0 * segBounds.size.height / 3.0);
    return segmentedControl;
}

-(void) loadView
{
    [super loadView];
    
    NSArray *segStrings = [NSArray arrayWithObjects:@"Standard", @"Satellite", @"Hybrid", nil];
    self.mapTypeSegCtl = [self makeSegmentedControl:segStrings withY:450];
    [self.mapTypeSegCtl addTarget:self action:@selector(setMapType:)
        forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.mapTypeSegCtl];
}

-(void) setMapType:(UISegmentedControl *)sender
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    UISegmentedControl *control = (UISegmentedControl *) sender;
    if( control.selectedSegmentIndex == 0 )
        self.mapView.mapType = MKMapTypeStandard;
    else if( control.selectedSegmentIndex == 1 )
        self.mapView.mapType = MKMapTypeSatellite;
    else
        self.mapView.mapType = MKMapTypeHybrid;
}

-(void) setMapLocation:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
