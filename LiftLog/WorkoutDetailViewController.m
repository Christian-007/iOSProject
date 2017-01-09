//
//  WorkoutDetailViewController.m
//  LiftLog
//
//  Created by Christian Ing on 09/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "WorkoutDetailViewController.h"
#import "Workouts.h"

@interface WorkoutDetailViewController ()

@end

@implementation WorkoutDetailViewController

- (void)setDetailItem:(id)newDetailItem {
    if(_detailItem != newDetailItem){
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    if (self.detailItem) {
        Workouts *work = (Workouts*) self.detailItem;
        self.nameLabel.text = work.name;
        self.imageView.image = [UIImage imageNamed:work.name];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
