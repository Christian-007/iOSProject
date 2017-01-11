//
//  RoutineDay.h
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoutineDay : NSObject
@property (strong) NSString *title;
-(RoutineDay *)initWithDay: (NSString *) t;
@end
