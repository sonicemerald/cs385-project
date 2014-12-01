//
//  FMDBDataAccess.h
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h" 
#import "FMResultSet.h" 
#import "Utility.h" 
#import "Location.h"

@interface FMDBDataAccess : NSObject
{
    
}

-(NSMutableArray *) getLocations;
-(BOOL) insertLocation:(Location *) location;
-(BOOL) updateLocation:(Location *) location;

@end
