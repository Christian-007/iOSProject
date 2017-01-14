//
//  Exercise.h
//  LiftLog
//
//  Created by Christian Ing on 12/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercise : NSObject
@property (strong) NSString *title;
-(Exercise *)initWithTitle: (NSString *) t;
@end
