//
//  AddWorkoutTableViewController.h
//  LiftLog
//
//  Created by Christian Ing on 16/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddWorkoutTableViewController : UITableViewController
@property (strong) NSArray *workouts;
@property (strong) NSArray *detailWorkouts;
- (IBAction)donePressed:(id)sender;
@end
