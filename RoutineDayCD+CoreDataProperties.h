//
//  RoutineDayCD+CoreDataProperties.h
//  LiftLog
//
//  Created by Christian Ing on 23/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RoutineDayCD.h"

NS_ASSUME_NONNULL_BEGIN

@interface RoutineDayCD (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSSet<ExerciseCD *> *exercises;
@property (nullable, nonatomic, retain) WorkoutsCD *workout;

@end

@interface RoutineDayCD (CoreDataGeneratedAccessors)

- (void)addExercisesObject:(ExerciseCD *)value;
- (void)removeExercisesObject:(ExerciseCD *)value;
- (void)addExercises:(NSSet<ExerciseCD *> *)values;
- (void)removeExercises:(NSSet<ExerciseCD *> *)values;

@end

NS_ASSUME_NONNULL_END
