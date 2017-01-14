//
//  WorkoutDayDelegate.h
//  LiftLog
//
//  Created by Christian Ing on 14/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Exercise.h"

@protocol WorkoutDayDelegate <NSObject>
-(void)updateWithExercise: (Exercise *)exc withSets: (NSMutableArray *)setsArray;
@end
