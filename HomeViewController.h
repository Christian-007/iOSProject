//
//  HomeViewController.h
//  LiftLog
//
//  Created by Christian Ing on 07/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutsCD.h"

@interface HomeViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *create;
@property (nonatomic, strong)WorkoutsCD *workoutsCD;

@property (strong) NSArray *workouts;


- (IBAction)createClicked:(id)sender;

@end
