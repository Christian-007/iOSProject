//
//  EditDayViewController.h
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoutineDay.h"
#import "RoutineDayCD.h"
#import "Exercise.h"
#import "ExerciseCD.h"
#import "Set.h"
#import "AddExerciseTableViewController.h"
#import "CreateSetViewController.h"
#import "WorkoutDayDelegate.h"
#import "AppDelegate.h"

@interface EditDayViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, WorkoutDayDelegate, NSFetchedResultsControllerDelegate>
@property (strong) RoutineDay *day;
@property (strong) Exercise *exc;
@property (weak, nonatomic) IBOutlet UITextField *routineDayTextField;
- (IBAction)daynameChanged:(id)sender;
@property (strong) Set *set;

- (IBAction)addExerciseButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *addbutton;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;

@property (nonatomic, strong) RoutineDayCD *addRoutineDayCD;
//@property (nonatomic, strong) WorkoutsCD *addWorkoutsCD;
@property (nonatomic, strong) ExerciseCD *addExerciseCD;


@property (strong) NSMutableArray *exerciseArray;
@property (strong) NSMutableArray *setArrays;
@end
