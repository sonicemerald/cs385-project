//
//  AppDelegate.m
//  Eddress
//
//  Created by student on 11/10/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import "AppDelegate.h"
#import "MapViewController.h"
#import "FavoritesTableViewController.h"
#import "PlacesTableViewController.h"


@interface AppDelegate()


@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Database stuffs
    self.databaseName = @"locations.db";
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [documentPaths objectAtIndex:0];
    self.databasePath = [documentDir stringByAppendingPathComponent:self.databaseName];
    
    [self createAndCheckDatabase];
    
    // Override point for customization after application launch.
    MapViewController *mvc = [[MapViewController alloc] init];
    FavoritesTableViewController *fvc = [[FavoritesTableViewController alloc] init];
    PlacesTableViewController *pvc = [[PlacesTableViewController alloc] init];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:mvc];
    UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:fvc];
    UINavigationController *nc3 = [[UINavigationController alloc] initWithRootViewController:pvc];
    
    [tab addChildViewController:nc1];
    [tab addChildViewController:nc2];
    [tab addChildViewController:nc3];
    
    UIImage *imageMap = [UIImage imageNamed:@"map.png"];
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTitle:@"Map" image:imageMap selectedImage:imageMap];
    mvc.tabBarItem = firstItem;
    
    UIImage *imageFavorites = [UIImage imageNamed:@"favorites.png"];
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTitle:@"Favorites" image:imageFavorites selectedImage:imageFavorites];
    fvc.tabBarItem = secondItem;
    
    UIImage *imagePlaces = [UIImage imageNamed:@"places.png"];
    UITabBarItem *thirdItem = [[UITabBarItem alloc] initWithTitle:@"Address Book" image:imagePlaces selectedImage:imagePlaces];
    pvc.tabBarItem = thirdItem;
    
    
    [self.window setRootViewController:tab];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

-(void) createAndCheckDatabase
{
    NSLog(@"CreateAndCheckDatabase Called");
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:self.databasePath];
    
    if(success) return;
    NSLog(@"No Success");
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databaseName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:self.databasePath error:nil];
    FMDatabase *database = [FMDatabase databaseWithPath:self.databasePath];
    [database open];
    [database executeUpdate:@"CREATE TABLE locations(ID INTEGER PRIMARY KEY NOT NULL, Name CHAR(50) NOT NULL, Description CHAR(255) NOT NULL, Latitude CHAR(10) NOT NULL, Longitude CHAR(10) NOT NULL, Favorites INTEGER NOT NULL)"];

    [database executeUpdate:@"INSERT INTO locations(Name, Description, Latitude, Longitude, Favorites) VALUES('SSU', 'School', '38.339387','-122.674181','1')"];
    
    [database close];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
