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
    
    BOOL success = [db executeUpdate:[NSString stringWithFormat:@"UPDATE location SET title = '%@', lat = '%@', long = '%@' where id = %d",location.name,location.latitude,location.longitude]];
    
    [db close];
    
    return success; 
}

-(BOOL) insertLocation:(Location *)location
{
    // insert customer into database
    
    FMDatabase *db = [FMDatabase databaseWithPath:[Utility getDatabasePath]];
    
    [db open];
    
    BOOL success =  [db executeUpdate:@"INSERT INTO location (title,lat, long) VALUES (?,?,?);",
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
    
    FMResultSet *results = [db executeQuery:@"SELECT * FROM location"];
    
    while([results next]) 
    {
        Location *location = [[Location alloc] init];
        
        location.id = [results intForColumn:@"id"];
        location.name = [results stringForColumn:@"title"];
        location.latitude = [results stringForColumn:@"lat"];
        location.longitude = [results stringForColumn:@"long"];
        
        [locations addObject:location];
        
    }
    
    [db close];
  
    return locations;

}

@end
