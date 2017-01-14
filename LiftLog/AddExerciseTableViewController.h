//
//  AddExerciseTableViewController.h
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutDayDelegate.h"
#import "Exercise.h"

@interface AddExerciseTableViewController : UITableViewController
@property (weak) id<WorkoutDayDelegate> workoutDayDelegate;
@property (strong) NSMutableArray *exercises;
@property (strong) NSArray *exerciseArray;
@end
