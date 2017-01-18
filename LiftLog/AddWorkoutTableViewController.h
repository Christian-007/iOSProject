//
//  AddWorkoutTableViewController.h
//  LiftLog
//
//  Created by Christian Ing on 16/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workouts.h"
#import "RoutineDay.h"
#import "Exercise.h"
#import "Set.h"
#import "CalendarDayDelegate.h"

@interface AddWorkoutTableViewController : UITableViewController
@property (weak) id<CalendarDayDelegate> calendarDayDelegate;
@property (strong) NSArray *workoutDays;
@property (strong) NSArray *workoutName;
@property (strong) NSArray *detailWorkouts1;
@property (strong) NSArray *detailWorkouts2;
@property (strong) NSMutableArray *arrayOfExercises;
@property (strong) NSMutableArray *setOfWorkouts;
@property (strong) Workouts *workout;
@property (strong) RoutineDay *routineDay;
@property (strong) Exercise *exercises;
@property (strong) Set *sets;
- (IBAction)donePressed:(id)sender;
@end
