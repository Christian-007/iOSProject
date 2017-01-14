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
#import "EditSetViewController.h"
#import "WorkoutDayDelegate.h"

@interface CreateSetViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak) id<WorkoutDayDelegate> workoutDayDelegate;
@property (weak, nonatomic) IBOutlet UIButton *newset;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;
- (IBAction)addSet:(id)sender;
- (IBAction)doneClicked:(id)sender;
@property (strong) Set *sets;
@property (strong) Exercise *exercise;
@property (strong) NSMutableArray *setArray;
@property (weak) IBOutlet UILabel *setLabel;
@property (weak) IBOutlet UILabel *weightLabel;
@property (weak) IBOutlet UILabel *repsLabel;
@end
