//
//  AppDelegate.m
//  LiftLog
//
//  Created by Christian Ing on 04/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "AppDelegate.h"
#import "Workouts.h"
#import "HomeViewController.h"
#import "HistoryCollectionViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSArray *workouts = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Overloading Workout"],[[Workouts alloc]initWithName:@"Test Workout"], [[Workouts alloc]initWithName:@"Another Workout"], nil];
    
    // Sending workouts array to HomeControllerView list
    UINavigationController *navController = (UINavigationController*)self.window.rootViewController;
    UINavigationController *navController2 = [navController.viewControllers objectAtIndex:0];
    HomeViewController *homeController = [navController2.viewControllers objectAtIndex:0];
    homeController.workouts = workouts;
    
    NSArray *workoutImages = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"angry_birds_cake.jpg"],[[Workouts alloc]initWithName:@"ham_and_cheese_panini.jpg"], [[Workouts alloc]initWithName:@"creme_brelee.jpg"], nil];
    
    // Sending workouts array to HistoryViewController list
    UINavigationController *navControllerHistory = [navController.viewControllers objectAtIndex:2];
    HistoryCollectionViewController *historyController = [navControllerHistory.viewControllers objectAtIndex:0];
    historyController.workouts = workoutImages;
    
    /*
     UINavigationController *navController = (UINavigationController*)self.window.rootViewController;
     MasterViewController *masterController = [navController.viewControllers objectAtIndex:0];
     masterController.guitars = guitars;
     */
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
