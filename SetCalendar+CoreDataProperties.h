//
//  SetCalendar+CoreDataProperties.h
//  LiftLog
//
//  Created by Christian Ing on 23/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SetCalendar.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetCalendar (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *reps;
@property (nullable, nonatomic, retain) NSNumber *setNumber;
@property (nullable, nonatomic, retain) NSString *weight;
@property (nullable, nonatomic, retain) ExerciseCalendar *exercise;

@end

NS_ASSUME_NONNULL_END
