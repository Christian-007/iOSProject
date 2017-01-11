//
//  EditDayViewController.m
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "EditDayViewController.h"

@interface EditDayViewController ()

@end

@implementation EditDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.day.title;
    self.navigationController.view.backgroundColor = [UIColor whiteColor]; // remove annoying dark gray bg color during segue transition
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
