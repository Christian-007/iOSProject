//
//  AddWorkoutTableViewController.m
//  LiftLog
//
//  Created by Christian Ing on 16/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "AddWorkoutTableViewController.h"
#import "ShowWorkoutDetailTableViewController.h"

@implementation AddWorkoutTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    NSArray *day1 = [NSArray arrayWithObjects:[[RoutineDay alloc]initWithDay:@"Chest Day"], [[RoutineDay alloc]initWithDay:@"Shoulder Day"], nil];
    
    NSArray *day2 = [NSArray arrayWithObjects:[[RoutineDay alloc]initWithDay:@"Arms Day"], [[RoutineDay alloc]initWithDay:@"Legs Day"], [[RoutineDay alloc]initWithDay:@"Cardio"], nil];
    
    self.workoutDays = [NSArray arrayWithObjects:day1, day2, nil];
    
    self.workoutName = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Overloading Workout"],[[Workouts alloc]initWithName:@"Shoulder Workout"], nil];
    
    self.arrayOfExercises = [NSMutableArray arrayWithObjects:[[Exercise alloc]initWithTitle:@"Shoulder Press"], [[Exercise alloc]initWithTitle:@"Lateral Raises"], nil];
    
    self.detailWorkouts2 = [NSArray arrayWithObjects:[[Exercise alloc]initWithTitle:@"Flat Barbell Bench Press"], [[Exercise alloc]initWithTitle:@"Incline Dumbbell Press"], nil];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:[[Set alloc]initWithSetNumber:1 withReps:@"10" withWeight:@"25"], [[Set alloc]initWithSetNumber:2 withReps:@"8" withWeight:@"30"], nil];
    self.setOfWorkouts = [NSMutableArray arrayWithObjects:array, array, nil];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.workoutDays.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.workoutDays objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"routineCell" forIndexPath:indexPath];
    
    RoutineDay *list = [self.workoutDays[indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = list.title;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Workouts *workoutName = [self.workoutName objectAtIndex:section];
    return workoutName.name;
}

- (IBAction)donePressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get the workout day --> search for the exercises that are belong to that workout day
    // Search for the sets of the corresponding exercise
    RoutineDay *rd = [self.workoutDays[indexPath.section] objectAtIndex:indexPath.row];
    NSLog(@"%@", rd.title);
    [self.calendarDayDelegate updateWithExercise:self.arrayOfExercises withSets:self.setOfWorkouts];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
