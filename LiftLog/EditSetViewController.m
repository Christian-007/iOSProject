//
//  EditSetViewController.m
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "EditSetViewController.h"

@interface EditSetViewController ()

@end

@implementation EditSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weightTextField.text = self.addSetCD.weight;
    self.weightTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.repsTextField.text = self.addSetCD.reps;
    self.repsTextField.keyboardType = UIKeyboardTypeNumberPad;
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

- (IBAction)weightChanged:(id)sender {
    self.addSetCD.weight = self.weightTextField.text;
}

- (IBAction)repsChanged:(id)sender {
    self.addSetCD.reps = self.repsTextField.text;
}
@end
