//
//  Exercise.m
//  LiftLog
//
//  Created by Christian Ing on 12/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise
-(Exercise *)initWithTitle: (NSString *) t {
    self = [super init];
    if (self) {
        _title = t;
    }
    return self;
}
@end
