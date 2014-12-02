//
//  FMDBDataAccess.m
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import "FMDBDataAccess.h"

@implementation FMDBDataAccess


-(BOOL) updateLocation:(Location *)location
{
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    BOOL success = [db executeUpdate:[NSString stringWithFormat:@"UPDATE locations SET name = '%@', latitude = '%@', longitude = '%@' where id = %d",location.name,location.latitude,location.longitude, location.id]];
    
    [db close];
    
    return success; 
}

-(BOOL) insertLocation:(Location *)location
{
    // insert customer into database
    
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    BOOL success =  [db executeUpdate:@"INSERT INTO locations (title,lat, long) VALUES (?,?,?);",
                     location.name,location.latitude,location.longitude, nil];
    
    [db close];
    
    return success; 
    
    return YES; 
}

-(NSMutableArray *) getLocations
{
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    FMResultSet *results = [db executeQuery:@"SELECT * FROM locations"];
    
    while([results next]) 
    {   NSLog(@"you are at getLocations");
        Location *location = [[Location alloc] init];
        
        location.id = [results intForColumn:@"id"];
        location.name = [results stringForColumn:@"name"];
        location.latitude = [results stringForColumn:@"latitude"];
        location.longitude = [results stringForColumn:@"longitude"];
        NSLog(@"%@",[results stringForColumn:@"description"]);
        location.locationDescription = [results stringForColumn:@"description"];
       
        location.favorite = [results intForColumn:@"favorites"];
        NSLog(@"%@", location.latitude);
        [locations addObject:location];
        
    }
    
    [db close];
  
    return locations;

}

-(NSMutableArray *) getFavorites
{
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    FMResultSet *results = [db executeQuery:@"SELECT * FROM locations WHERE Favorites > 0"];
    
    while([results next])
    {   NSLog(@"you are at getLocations");
        Location *location = [[Location alloc] init];
        
        location.id = [results intForColumn:@"id"];
        location.name = [results stringForColumn:@"name"];
        location.latitude = [results stringForColumn:@"latitude"];
        location.longitude = [results stringForColumn:@"longitude"];
        location.locationDescription = [results stringForColumn:@"description"];
        location.favorite = [results intForColumn:@"favorites"];
        NSLog(@"%@", location.latitude);
        [locations addObject:location];
        
    }
    
    [db close];
    
    return locations;
    
}

@end
