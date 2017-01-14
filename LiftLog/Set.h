//
//  Set.h
//  LiftLog
//
//  Created by Christian Ing on 12/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Set : NSObject
@property (assign) int setNumber;
@property (strong) NSString *reps;
@property (strong) NSString *weight;
-(Set *) initWithSetNumber: (int)num withReps: (NSString *)reps withWeight: (NSString *) weight;
@end
