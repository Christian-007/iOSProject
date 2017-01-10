//
//  HomeViewController.h
//  LiftLog
//
//  Created by Christian Ing on 07/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIButton *create;
- (IBAction)createClicked:(id)sender;
@property (strong) NSArray *workouts;
@end
