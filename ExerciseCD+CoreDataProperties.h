//
//  ExerciseCD+CoreDataProperties.h
//  LiftLog
//
//  Created by Christian Ing on 23/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ExerciseCD.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExerciseCD (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) RoutineDayCD *routineday;
@property (nullable, nonatomic, retain) NSSet<SetCD *> *sets;

@end

@interface ExerciseCD (CoreDataGeneratedAccessors)

- (void)addSetsObject:(SetCD *)value;
- (void)removeSetsObject:(SetCD *)value;
- (void)addSets:(NSSet<SetCD *> *)values;
- (void)removeSets:(NSSet<SetCD *> *)values;

@end

NS_ASSUME_NONNULL_END
