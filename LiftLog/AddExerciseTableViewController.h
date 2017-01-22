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
#import "ExerciseCD.h"
#import "SetCD.h"
#import "AppDelegate.h"

@interface AddExerciseTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
@property (weak) id<WorkoutDayDelegate> workoutDayDelegate;
@property (strong) NSMutableArray *exercises;
@property (strong) NSArray *exerciseArray;
@property (strong) NSArray *exerciseCDArray;

@property (nonatomic, strong) ExerciseCD *addExerciseCD;
@property (nonatomic, strong) ExerciseCD *addSetCD;

@end
