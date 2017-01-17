//
//  AddWorkoutTableViewController.m
//  LiftLog
//
//  Created by Christian Ing on 16/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "AddWorkoutTableViewController.h"
#import "ShowWorkoutDetailTableViewController.h"
#import "Workouts.h"

@implementation AddWorkoutTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.workouts = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Overloading Workout"], nil];
    self.detailWorkouts = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Arnold Press"], [[Workouts alloc]initWithName:@"Flat Bench Press"], [[Workouts alloc]initWithName:@"Dumbbell Fly"], nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.workouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"routineCell" forIndexPath:indexPath];
    //UITableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Workouts *workout = [self.workouts objectAtIndex:indexPath.row];
    cell.textLabel.text = workout.name;
    
    Workouts *w = [self.detailWorkouts objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@\n", w.name];
    //cell.imageView.image = [UIImage imageNamed:@"gym_icon1.jpg"];
    
    //Workouts *w = [self.detailWorkouts objectAtIndex:indexPath.row];
    //detailCell.textLabel.text = w.name;

    
    return cell;
}

#pragma mark - Navigation

// Sending the selected cell data to DayViewController class
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    /*if ([[segue identifier] isEqualToString:@"showDay"]) {
     DayViewController *d = [segue destinationViewController];
     d.day = [self.workoutDays objectAtIndex:[self.customTableView indexPathForSelectedRow].row];
     }*/
    if ([[segue identifier] isEqualToString:@"showDay"]) {
        ShowWorkoutDetailTableViewController *s = [segue destinationViewController];
        s.workout= [self.workouts objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

- (IBAction)donePressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
