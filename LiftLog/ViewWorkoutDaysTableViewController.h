//
//  ViewWorkoutDaysTableViewController.h
//  LiftLog
//
//  Created by Andrejus Skulis on 21/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutsCD.h"
#import "RoutineDayCD.h"

@interface ViewWorkoutDaysTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) WorkoutsCD *selectedWorkoutsCD;

@end
