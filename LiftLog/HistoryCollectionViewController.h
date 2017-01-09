//
//  HistoryCollectionViewController.h
//  LiftLog
//
//  Created by Christian Ing on 05/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WorkoutDetailViewController;

@interface HistoryCollectionViewController : UICollectionViewController
@property (strong, nonatomic) WorkoutDetailViewController *workoutViewController;
@property (strong) NSArray* workouts;
@end