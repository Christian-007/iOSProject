//
//  EditSetViewController.h
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Set.h"
#import "SetCD.h"

@interface EditSetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *repsTextField;
- (IBAction)weightChanged:(id)sender;
- (IBAction)repsChanged:(id)sender;
@property (strong) Set *set;

@property (nonatomic, strong) SetCD *addSetCD;

@end
