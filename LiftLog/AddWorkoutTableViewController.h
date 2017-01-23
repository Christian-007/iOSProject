//
//  AddWorkoutTableViewController.h
//  LiftLog
//
//  Created by Christian Ing on 16/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workouts.h"
#import "WorkoutsCD.h"
#import "WorkoutsCalendar.h"
#import "RoutineDay.h"
#import "RoutineDayCD.h"
#import "RoutineDayCalendar.h"
#import "ExerciseCD.h"
#import "Exercise.h"
#import "ExerciseCalendar.h"
#import "Set.h"
#import "SetCD.h"
#import "SetCalendar.h"
#import "CalendarDayDelegate.h"
#import "AppDelegate.h"

@interface AddWorkoutTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

//@property (weak) id<CalendarDayDelegate> calendarDayDelegate;
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

@property (nonatomic, strong) NSSet<WorkoutsCD *> *workoutsList;

@property (strong) WorkoutsCalendar *workCalendar;

- (IBAction)cancelPressed:(id)sender;
@end
