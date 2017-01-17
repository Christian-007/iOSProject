//
//  ShowWorkoutDetailTableViewController.m
//  LiftLog
//
//  Created by Christian Ing on 16/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "ShowWorkoutDetailTableViewController.h"
#import "Workouts.h"

@implementation ShowWorkoutDetailTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.title = self.workout.name;
    self.workouts = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Overloading Workout"], [[Workouts alloc]initWithName:@"Chest Workout"], nil];
    
    self.detailWorkouts1 = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Arnold Press"], [[Workouts alloc]initWithName:@"Flat Bench Press"], [[Workouts alloc]initWithName:@"Dumbbell Fly"], nil];
    self.detailWorkouts2 = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Incline Bench Press"], [[Workouts alloc]initWithName:@"Dumbbell Fly"], nil];
    self.totalWorkouts = [[NSMutableDictionary alloc]init];
    Workouts *work;

    for (int i=0; i<self.workouts.count; i++) {
        work = [self.workouts objectAtIndex:i];
        [self.totalWorkouts setObject:self.detailWorkouts1 forKey:work.name];
        self.detailWorkouts1 = self.detailWorkouts2;
    }
    /* for(NSString *key in [self.totalWorkouts allKeys]) {
        NSLog(@"key: %@", key);
        NSLog(@"%@",[self.totalWorkouts objectForKey:key]);
    } */
    //self.totalWorkouts = @{@"B" : @[@"Bear", @"Black Swan", @"Buffalo"],@"W" : @[@"Whale", @"Whale Shark", @"Wombat"]};
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.workouts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    Workouts *anotherW = [self.workouts objectAtIndex:section];
    NSString *sectionTitle = anotherW.name;
    NSArray *sectionDetails = [self.totalWorkouts objectForKey:sectionTitle];
    NSLog(@"sectionDetails: %lu", sectionDetails.count);
    return sectionDetails.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exerciseCell" forIndexPath:indexPath];
    
    // Configure the cell...
//    Workouts *workout = [self.workouts objectAtIndex:indexPath.row];
//    cell.textLabel.text = workout.name;
    //cell.imageView.image = [UIImage imageNamed:@"gym_icon1.jpg"];
    Workouts *anotherW = [self.workouts objectAtIndex:indexPath.section];
    NSString *sectionTitle = anotherW.name;
    NSArray *sectionDetails = [self.totalWorkouts objectForKey:sectionTitle];
    Workouts *anotherW2 = [sectionDetails objectAtIndex:indexPath.row];
    NSString *detail = anotherW2.name;
    cell.textLabel.text = detail;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Workouts *anotherW = [self.workouts objectAtIndex:section];
    return anotherW.name;
}
@end
