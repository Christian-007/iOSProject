//
//  WorkoutsCD+CoreDataProperties.h
//  LiftLog
//
//  Created by Andrejus Skulis on 21/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WorkoutsCD.h"

NS_ASSUME_NONNULL_BEGIN

@interface WorkoutsCD (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<RoutineDayCD *> *routinedays;

@end

@interface WorkoutsCD (CoreDataGeneratedAccessors)

- (void)addRoutinedaysObject:(RoutineDayCD *)value;
- (void)removeRoutinedaysObject:(RoutineDayCD *)value;
- (void)addRoutinedays:(NSSet<RoutineDayCD *> *)values;
- (void)removeRoutinedays:(NSSet<RoutineDayCD *> *)values;

@end

NS_ASSUME_NONNULL_END
