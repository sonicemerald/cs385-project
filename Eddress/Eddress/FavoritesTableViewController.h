//
//  FavoritesTableViewController.h
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesDataSource.h"

@interface FavoritesTableViewController : UITableViewController</*DataSourceReadyForUse,*/ UITableViewDelegate,UITableViewDataSource> //DataSourceReadyForUse not yet implemented in PlacesDataSource.m

@end
