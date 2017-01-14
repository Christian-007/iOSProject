//
//  CreateSetViewController.m
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "CreateSetViewController.h"

@interface CreateSetViewController ()

@end

@implementation CreateSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.newset.layer.cornerRadius = 20;
    self.newset.clipsToBounds = YES;
    
    self.setArray = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.setLabel.text = [NSString stringWithFormat:@"%d", (int)self.sets.setNumber];
    self.weightLabel.text = [NSString stringWithFormat:@"%@ kgs", self.sets.weight];
    self.repsLabel.text = [NSString stringWithFormat:@"%@", self.sets.reps];
    [self.customTableView reloadData];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"addSet"]) {
        EditSetViewController *e = [segue destinationViewController];
        self.sets = [self.setArray objectAtIndex:[self.customTableView indexPathForSelectedRow].row];
        e.set = self.sets;
    }
    if ([[segue identifier] isEqualToString:@"showSet"]) {
        EditSetViewController *e = [segue destinationViewController];
        self.sets = [self.setArray objectAtIndex:[self.customTableView indexPathForSelectedRow].row];
        e.set = self.sets;
    }

}

- (IBAction)addSet:(id)sender {
    [self.setArray addObject:[[Set alloc]initWithSetNumber:(int)self.setArray.count+1 withReps:@"10" withWeight:@"20"]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.setArray.count-1 inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.customTableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
    [self.customTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self performSegueWithIdentifier:@"addSet" sender:self];
}

- (IBAction)doneClicked:(id)sender {
    // Send data back to prev ViewController through delegate
    [self.workoutDayDelegate updateWithExercise:self.exercise withSets:self.setArray];
    
    // Pop back to previous ViewController
    NSArray *array = [self.navigationController viewControllers];
    [self.navigationController popToViewController:[array objectAtIndex:1] animated: YES];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.setArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setCell" forIndexPath:indexPath];
    
    Set *set = [self.setArray objectAtIndex:indexPath.row];
    
    self.setLabel = (UILabel *)[cell viewWithTag:1];
    self.weightLabel = (UILabel *)[cell viewWithTag:2];
    self.repsLabel = (UILabel *)[cell viewWithTag:3];
    
    self.setLabel.text = [NSString stringWithFormat:@"%d", (int)set.setNumber];
    self.weightLabel.text = [NSString stringWithFormat:@"%@ kgs", set.weight];
    self.repsLabel.text = [NSString stringWithFormat:@"%@", set.reps];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"Weight: %@ kgs Reps: %@", set.weight, set.reps];
    
    return cell;
}
@end
