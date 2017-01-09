//
//  Workouts.m
//  LiftLog
//
//  Created by Christian Ing on 07/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "Workouts.h"

@implementation Workouts
-(Workouts*)initWithName:(NSString*)n {
    self = [super init];
    if (self) {
        _name = n;
    }
    return self;
}
@end
