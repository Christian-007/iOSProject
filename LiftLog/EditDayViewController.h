//
//  EditDayViewController.h
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoutineDay.h"

@interface EditDayViewController : UIViewController
@property (strong) UIBarButtonItem *backButton;
@property (strong) RoutineDay *day;
@end
