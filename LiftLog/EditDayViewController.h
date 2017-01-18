//
//  EditDayViewController.h
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoutineDay.h"
#import "Exercise.h"
#import "Set.h"
#import "AddExerciseTableViewController.h"
#import "CreateSetViewController.h"
#import "WorkoutDayDelegate.h"

@interface EditDayViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, WorkoutDayDelegate>
@property (strong) RoutineDay *day;
@property (strong) Exercise *exc;
@property (weak, nonatomic) IBOutlet UITextField *routineDayTextField;
@property (strong) Set *set;
- (IBAction)addExerciseButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addbutton;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;
@property (strong) NSMutableArray *exerciseArray;
@property (strong) NSMutableArray *setArrays;
@end
