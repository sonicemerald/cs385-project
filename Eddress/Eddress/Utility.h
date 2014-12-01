//
//  Utility.h
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h" 

@interface Utility : NSObject
{
    
}

+(NSString *) getDatabasePath; 
+(void) showAlert:(NSString *) title message:(NSString *) msg; 

@end
