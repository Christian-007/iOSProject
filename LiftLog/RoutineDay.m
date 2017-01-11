//
//  RoutineDay.m
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "RoutineDay.h"

@implementation RoutineDay
-(RoutineDay *)initWithDay:(NSString *)t
{
    self = [super init];
    if (self) {
        _title = t;
    }
    return self;
}
@end
