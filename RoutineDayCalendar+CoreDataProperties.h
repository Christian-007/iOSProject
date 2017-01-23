//
//  RoutineDayCalendar+CoreDataProperties.h
//  LiftLog
//
//  Created by Christian Ing on 23/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RoutineDayCalendar.h"

NS_ASSUME_NONNULL_BEGIN

@interface RoutineDayCalendar (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSSet<ExerciseCalendar *> *exercises;
@property (nullable, nonatomic, retain) WorkoutsCalendar *workout;

@end

@interface RoutineDayCalendar (CoreDataGeneratedAccessors)

- (void)addExercisesObject:(ExerciseCalendar *)value;
- (void)removeExercisesObject:(ExerciseCalendar *)value;
- (void)addExercises:(NSSet<ExerciseCalendar *> *)values;
- (void)removeExercises:(NSSet<ExerciseCalendar *> *)values;

@end

NS_ASSUME_NONNULL_END
