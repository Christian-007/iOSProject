//
//  Workouts.h
//  LiftLog
//
//  Created by Christian Ing on 07/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Workouts : NSObject
@property (strong) NSString *name;
-(Workouts*)initWithName:(NSString*)n;
@end
