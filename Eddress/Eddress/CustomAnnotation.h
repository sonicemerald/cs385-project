//
//  CustomAnnotation.h
//  Eddress
//
//  Created by Joji Kubota on 11/25/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject <MKAnnotation>

@property CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

- (id) initWithCoordinate:(CLLocationCoordinate2D) coordinate;
@end
