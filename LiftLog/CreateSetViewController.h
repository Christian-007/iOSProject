//
//  CreateSetViewController.h
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"
#import "Set.h"
#import "SetCD.h"
#import "ExerciseCD.h"
#import "EditSetViewController.h"
#import "WorkoutDayDelegate.h"
#import "AppDelegate.h"

@interface CreateSetViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>
@property (weak) id<WorkoutDayDelegate> workoutDayDelegate;
@property (weak, nonatomic) IBOutlet UIButton *newset;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;
- (IBAction)addSet:(id)sender;
@property (strong) Set *sets;
@property (strong) Exercise *exercise;
@property (strong) NSMutableArray *setArray;
@property (weak) IBOutlet UILabel *setLabel;
@property (weak) IBOutlet UILabel *weightLabel;
@property (weak) IBOutlet UILabel *repsLabel;

@property (strong) ExerciseCD *exerciseCD;

@property (nonatomic, strong) SetCD *selectedSetCD;

@property (nonatomic, strong) SetCD *addSetCD;

@end
