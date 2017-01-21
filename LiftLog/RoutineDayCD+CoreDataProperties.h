//
//  RoutineDayCD+CoreDataProperties.h
//  LiftLog
//
//  Created by Andrejus Skulis on 21/01/2017.
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
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *exercises;
@property (nullable, nonatomic, retain) NSManagedObject *workout;

@end

@interface RoutineDayCD (CoreDataGeneratedAccessors)

- (void)addExercisesObject:(NSManagedObject *)value;
- (void)removeExercisesObject:(NSManagedObject *)value;
- (void)addExercises:(NSSet<NSManagedObject *> *)values;
- (void)removeExercises:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
