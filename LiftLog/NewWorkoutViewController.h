//
//  NewWorkoutViewController.h
//  LiftLog
//
//  Created by Christian Ing on 10/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreViewController.h"
#import "WorkoutsCD.h"
#import "RoutineDayCD.h"


@interface NewWorkoutViewController : CoreViewController

- (IBAction)cancelClicked:(id)sender;
- (IBAction)addWorkoutDay:(id)sender;
- (IBAction)save:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UITableView *customTableView;
@property (strong) NSMutableArray *workoutDays;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (nonatomic, strong) WorkoutsCD *addWorkoutsCD;
@property (nonatomic, strong) RoutineDayCD *addRoutineDayCD;

//@property (nonatomic, strong) WorkoutsCD *selectedWorkoutsCD;

@end
