//
//  ShowWorkoutDetailTableViewController.h
//  LiftLog
//
//  Created by Christian Ing on 16/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workouts.h"

@interface ShowWorkoutDetailTableViewController : UITableViewController
@property (strong) NSArray *workouts;
@property (strong) NSArray *detailWorkouts1;
@property (strong) NSArray *detailWorkouts2;
@property (strong) Workouts *workout;
@property (strong) NSMutableDictionary *totalWorkouts;
@end
