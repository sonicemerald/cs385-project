//
//  MapViewController.m
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@property (nonatomic) UISegmentedControl *mapTypeSegCtl;
@property (nonatomic) UISegmentedControl *mapLocationSegCtl;
@property (nonatomic) MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;

-(void) setMapType: (id) sender;
-(void) setMapLocation: (id) sender;
-(UISegmentedControl *) makeSegmentedControl: (NSArray *) labels withY: (NSInteger) yValue;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*CoreLocation Stuff
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    [self.locationManager stopUpdatingLocation];*/
    
    //Map Stuff
    CGRect bounds = [[UIScreen mainScreen] applicationFrame];
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, bounds.size.height-29)];
    self.mapView.delegate = self;
    [self.view insertSubview:self.mapView atIndex:0];
    self.mapView.showsUserLocation = YES; //If set, will track location of device
    
    self.mapView.mapType = MKMapTypeStandard;
    // Do any additional setup after loading the view.
    /*
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = self.locationManager.location.coordinate.latitude;
    newRegion.center.longitude = self.locationManager.location.coordinate.longitude;
    newRegion.span.latitudeDelta = 0.0004;
    newRegion.span.longitudeDelta = 0.005411;
     
    NSLog(@"latitude: %f", self.locationManager.location.coordinate.latitude);
    NSLog(@"longitude: %f", self.locationManager.location.coordinate.longitude);
    CoreLocationAnnotation *coreAnnotation = [[CoreLocationAnnotation alloc] init];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([coreAnnotation coordinate], 0, 0);
    [self.mapView addAnnotation: coreAnnotation];

    [self.mapView setRegion:region animated:YES];*/
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
