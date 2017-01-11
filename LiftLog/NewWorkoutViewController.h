//
//  NewWorkoutViewController.h
//  LiftLog
//
//  Created by Christian Ing on 10/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewWorkoutViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
- (IBAction)cancelClicked:(id)sender;
- (IBAction)addWorkoutDay:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *customTableView;
@property (strong) NSMutableArray *workoutDays;
@end
