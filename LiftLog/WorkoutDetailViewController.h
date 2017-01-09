//
//  WorkoutDetailViewController.h
//  LiftLog
//
//  Created by Christian Ing on 09/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkoutDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) id detailItem;
@end
