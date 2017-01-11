//
//  DayViewController.h
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoutineDay.h"

@interface DayViewController : UIViewController
@property (strong) UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong) RoutineDay *day;
-(void)editDay;
@end
