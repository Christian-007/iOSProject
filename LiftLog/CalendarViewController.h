//
//  CalendarViewController.h
//  LiftLog
//
//  Created by Christian Ing on 06/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workouts.h"
#import "RoutineDay.h"
#import "Exercise.h"
#import "Set.h"
#import "AddWorkoutTableViewController.h"
#import "CalendarDayDelegate.h"

@interface CalendarViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, CalendarDayDelegate>
- (IBAction)backClicked:(id)sender;
- (IBAction)forwardClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dateNow;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong) NSDate *today;
@property (strong) NSArray *workoutLog;
@property (strong) NSArray *routineName;
@property (strong) NSMutableArray *exerciseArray;
@property (strong) NSMutableArray *setsArray;
@end
