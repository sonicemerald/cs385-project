//
//  Location.m
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import "Location.h"

@interface Location()

@property (nonatomic) NSMutableDictionary *locationAttrs;

@end

@implementation Location

-(id) initWithDictionary:(NSDictionary *)dictionary
{
    if( (self = [super init]) == nil )
        return nil;
    self.locationAttrs = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    return self;
}

-(void) addValue:(NSString *)attrVal forAttribute:(NSString *)attrName
{
    [self.locationAttrs setObject:attrVal forKey:attrName];
}

-(NSString *) getValueForAttribute:(NSString *)attr
{
    return [self.locationAttrs valueForKey:attr];
}

-(NSString *) name
{
    return [self.locationAttrs valueForKey:@"name"];
}

-(NSString *) address
{
    return [self.locationAttrs valueForKey:@"address"];
}

-(NSNumber *) latitude
{
    return [self.locationAttrs valueForKey:@"latitude"];
}

-(NSNumber *) longitude
{
    return [self.locationAttrs valueForKey:@"longitude"];
}

-(NSString *) description
{
    return [self.locationAttrs valueForKey:@"description"];
}

-(BOOL *) favorite
{
    NSString *isFavorite = [self.locationAttrs valueForKey:@"isFavorite"];
    if ([isFavorite  isEqual: @"YES"])
        return YES;
    else //([isFavorite isEqual: @"NO"])
        return NO;
}

@end
