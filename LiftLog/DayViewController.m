//
//  DayViewController.m
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "DayViewController.h"
#import "EditDayViewController.h"

@interface DayViewController ()

@end

@implementation DayViewController

@synthesize day, editButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.titleLabel.text = self.day.title;
    self.navigationController.view.backgroundColor = [UIColor whiteColor]; // remove annoying dark gray bg color during segue transition
    self.editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editDay)];
    self.navigationItem.rightBarButtonItem = self.editButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)editDay {
    [self performSegueWithIdentifier:@"editDay" sender:self];
}


#pragma mark - Navigation

// Navigate to EditDayViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"editDay"]){
        EditDayViewController *d = [segue destinationViewController];
        d.day = self.day;
    }
}

@end
