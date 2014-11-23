//
//  PlacesTableViewController.h
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlacesDataSource.h"

@interface PlacesTableViewController : UITableViewController</*DataSourceReadyForUse,*/ UITableViewDelegate,UITableViewDataSource> //DataSourceReadyForUse not yet implemented in PlacesDataSource.m

@end
