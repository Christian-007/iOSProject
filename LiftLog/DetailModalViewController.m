//
//  DetailModalViewController.m
//  LiftLog
//
//  Created by Christian Ing on 06/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "DetailModalViewController.h"

@interface DetailModalViewController ()

@end

@implementation DetailModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)donePressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"pressed Done Button");
}
- (IBAction)segmentedValueChanged:(id)sender {
    UISegmentedControl *segment = sender;
    switch (segment.selectedSegmentIndex) {
        case 0:
            self.graphContainerView.hidden = NO;
            break;
            
        case 1:
            self.graphContainerView.hidden = YES;
            break;
            
        default:
            break;
    }
}
@end
