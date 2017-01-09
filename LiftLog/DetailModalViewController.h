//
//  DetailModalViewController.h
//  LiftLog
//
//  Created by Christian Ing on 06/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailModalViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *resultsContainerView;
@property (weak, nonatomic) IBOutlet UIView *graphContainerView;
- (IBAction)segmentedValueChanged:(id)sender;
- (IBAction)donePressed:(id)sender;
@end
