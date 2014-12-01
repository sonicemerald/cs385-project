//
//  PlacesTableViewController.h
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDBDataAccess.h"
#import "QuickAddViewController.h"

@interface PlacesTableViewController : UITableViewController<QuickAddViewControllerDelegate> //DataSourceReadyForUse not yet implemented in PlacesDataSource.m

@property (nonatomic, strong) NSMutableArray *locations;

-(void) populateLocations;

@end
