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
#import "AddLocationViewController.h"

@interface AppDelegate()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    MapViewController *mvc = [[MapViewController alloc] init];
    FavoritesTableViewController *fvc = [[FavoritesTableViewController alloc] init];
    PlacesTableViewController *pvc = [[PlacesTableViewController alloc] init];
    AddLocationViewController *alvc = [[AddLocationViewController alloc] init];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:mvc];
    UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:fvc];
    UINavigationController *nc3 = [[UINavigationController alloc] initWithRootViewController:pvc];
    UINavigationController *nc4 = [[UINavigationController alloc] initWithRootViewController:alvc];
    
    [tab addChildViewController:nc1];
    [tab addChildViewController:nc2];
    [tab addChildViewController:nc3];
    [tab addChildViewController:nc4];
    
    UIImage *imageMap = [UIImage imageNamed:@"map.png"];
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTitle:@"Map" image:imageMap selectedImage:imageMap];
    mvc.tabBarItem = firstItem;
    
    UIImage *imageFavorites = [UIImage imageNamed:@"favorites.png"];
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTitle:@"Favorites" image:imageFavorites selectedImage:imageFavorites];
    fvc.tabBarItem = secondItem;
    
    UIImage *imagePlaces = [UIImage imageNamed:@"places.png"];
    UITabBarItem *thirdItem = [[UITabBarItem alloc] initWithTitle:@"Address Book" image:imagePlaces selectedImage:imagePlaces];
    pvc.tabBarItem = thirdItem;
    
    UIImage *imageAddLocation = [UIImage imageNamed:@"plus.png"];
    UITabBarItem *fourthItem = [[UITabBarItem alloc] initWithTitle:@"Add Location" image:imageAddLocation selectedImage:imageAddLocation];
    alvc.tabBarItem = fourthItem;
    
    [self.window setRootViewController:tab];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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
