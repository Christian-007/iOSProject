//
//  SetCD+CoreDataProperties.h
//  LiftLog
//
//  Created by Andrejus Skulis on 22/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SetCD.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetCD (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *reps;
@property (nullable, nonatomic, retain) NSNumber *setNumber;
@property (nullable, nonatomic, retain) NSString *weight;
@property (nullable, nonatomic, retain) ExerciseCD *exercise;

@end

NS_ASSUME_NONNULL_END
