//
//  ExerciseCalendar+CoreDataProperties.h
//  LiftLog
//
//  Created by Christian Ing on 23/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ExerciseCalendar.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExerciseCalendar (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) RoutineDayCalendar *routineday;
@property (nullable, nonatomic, retain) NSSet<SetCalendar *> *sets;

@end

@interface ExerciseCalendar (CoreDataGeneratedAccessors)

- (void)addSetsObject:(SetCalendar *)value;
- (void)removeSetsObject:(SetCalendar *)value;
- (void)addSets:(NSSet<SetCalendar *> *)values;
- (void)removeSets:(NSSet<SetCalendar *> *)values;

@end

NS_ASSUME_NONNULL_END
