//
//  Set.m
//  LiftLog
//
//  Created by Christian Ing on 12/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "Set.h"

@implementation Set
-(Set *) initWithSetNumber: (int)num withReps: (NSString *)reps withWeight: (NSString *) weight {
    self = [super init];
    if (self) {
        _setNumber = num;
        _reps = reps;
        _weight = weight;
    }
    return self;
}
@end
