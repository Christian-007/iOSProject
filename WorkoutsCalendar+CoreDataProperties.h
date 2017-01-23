//
//  WorkoutsCalendar+CoreDataProperties.h
//  LiftLog
//
//  Created by Christian Ing on 23/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WorkoutsCalendar.h"

NS_ASSUME_NONNULL_BEGIN

@interface WorkoutsCalendar (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSDate *cdate;
@property (nullable, nonatomic, retain) NSSet<RoutineDayCalendar *> *routinedays;

@end

@interface WorkoutsCalendar (CoreDataGeneratedAccessors)

- (void)addRoutinedaysObject:(RoutineDayCalendar *)value;
- (void)removeRoutinedaysObject:(RoutineDayCalendar *)value;
- (void)addRoutinedays:(NSSet<RoutineDayCalendar *> *)values;
- (void)removeRoutinedays:(NSSet<RoutineDayCalendar *> *)values;

@end

NS_ASSUME_NONNULL_END
