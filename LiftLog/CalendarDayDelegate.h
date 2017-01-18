//
//  CalendarDayDelegate.h
//  LiftLog
//
//  Created by Christian Ing on 17/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CalendarDayDelegate <NSObject>
-(void)updateWithExercise: (NSMutableArray *)exc withSets: (NSMutableArray *)setsArray;
@end