//
//  CalendarViewController.h
//  LiftLog
//
//  Created by Christian Ing on 06/01/2017.
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
#import "AddWorkoutTableViewController.h"
#import "CalendarDayDelegate.h"
#import "AppDelegate.h"

@interface CalendarViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, CalendarDayDelegate, NSFetchedResultsControllerDelegate>
- (IBAction)backClicked:(id)sender;
- (IBAction)forwardClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dateNow;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;

//@property (nonatomic, strong) NSSet<WorkoutsCD *> *routineList;

@property (strong) NSDate *today;
@property (strong) NSArray *workoutLog;
@property (strong) NSArray *routineName;
@property (strong) NSMutableArray *exerciseArray;
@property (strong) NSMutableArray *setsArray;
@end
