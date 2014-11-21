//
//  Location.h
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

-(void) addValue: (NSString *) attrVal forAttribute: (NSString *) attrName;
-(NSString *) getValueForAttribute: (NSString *) attr;
-(void) print;

-(NSString *) name;
-(NSString *) address;
-(NSNumber *) latitude;
-(NSNumber *) longitude;
-(NSString *) description;
-(BOOL *) favorite;
-(id) initWithDictionary: (NSDictionary *) dictionary;



@end