//
//  AppDelegate.h
//  Eddress
//
//  Created by student on 11/10/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) NSString *databaseName;
@property (nonatomic,strong) NSString *databasePath;

@end
