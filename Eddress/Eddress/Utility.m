//
//  Utility.m
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(NSString *) getDatabasePath
{
    NSString *databasePath = [(AppDelegate *)[[UIApplication sharedApplication] delegate] databasePath];
    //NSString *databasePath = @"/Users/joji/Desktop/2014Fall/cs385/Project04/cs385-project/Eddress/Eddress/locations.db";
    NSLog(databasePath);
    return databasePath; 
}

+(void) showAlert:(NSString *)title message:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];

    [alert show];
}

@end
