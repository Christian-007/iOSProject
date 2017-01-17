//
//  CalendarViewController.m
//  LiftLog
//
//  Created by Christian Ing on 06/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "CalendarViewController.h"
#import "Workouts.h"
#import "RoutineDay.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *workout1 = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Flat Bench Press"],[[Workouts alloc]initWithName:@"Incline Dumbbell Press"], [[Workouts alloc]initWithName:@"Dumbbell Fly"], nil];
    
    NSArray *workout2 = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Barbell Shoulder Press"], [[Workouts alloc]initWithName:@"Arnold Press"], [[Workouts alloc]initWithName:@"Lateral Raises"], [[Workouts alloc]initWithName:@"Triceps Pull Down"], nil];
    
    self.workoutLog = [NSArray arrayWithObjects:workout1, workout2, nil];
    
    self.routineName = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Chest Workout"],[[Workouts alloc]initWithName:@"Shoulder Workout"], nil];
    
    self.today = [[NSDate alloc]init];
    
    NSDateComponents *comps = [[NSCalendar currentCalendar] components: NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger day = [comps day];
    NSInteger month = [comps month];
    NSInteger year = [comps year];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:month-1];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self.today];
    
    NSInteger weekday = [components weekday];
    NSString *weekdayName = [dateFormatter weekdaySymbols][weekday - 1];
    
    NSLog(@"%ld-%ld-%ld is a %@", day, month, year, weekdayName);
    self.dateNow.text = [NSString stringWithFormat:@"%@, %ld %@ %ld", weekdayName, day, monthName, year];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backClicked:(id)sender
{
    
    NSTimeInterval sec = 24 * 60 * 60;
    NSDate *yesterday = [self.today dateByAddingTimeInterval:-sec];
    
    NSDateComponents *comps = [[NSCalendar currentCalendar] components: NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:yesterday];
    NSInteger day = [comps day];
    NSInteger month = [comps month];
    NSInteger year = [comps year];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:month-1];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:yesterday];
    
    NSInteger weekday = [components weekday];
    NSString *weekdayName = [dateFormatter weekdaySymbols][weekday - 1];
    
    NSLog(@"%@, %ld %@ %ld", weekdayName, day, monthName, year);
    
    self.today = yesterday;
    
    self.dateNow.text = [NSString stringWithFormat:@"%@, %ld %@ %ld", weekdayName, day, monthName, year];
    
    // Change the data of the workout log here
    NSArray *workout1 = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Test Workout"], [[Workouts alloc]initWithName:@"Another Workout"], nil];
    NSArray *workout2 = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Just Another Workout"], [[Workouts alloc]initWithName:@"And Again Workout"], [[Workouts alloc]initWithName:@"Another Workout"], [[Workouts alloc]initWithName:@"Last Workout"], nil];
    
    self.workoutLog = [NSArray arrayWithObjects:workout1, workout2, nil];
    [self.collectionView reloadData]; // Reload/refresh the collection view
}

- (IBAction)forwardClicked:(id)sender
{
    NSTimeInterval sec = 24 * 60 * 60;
    NSDate *yesterday = [self.today dateByAddingTimeInterval:sec];
    
    NSDateComponents *comps = [[NSCalendar currentCalendar] components: NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:yesterday];
    NSInteger day = [comps day];
    NSInteger month = [comps month];
    NSInteger year = [comps year];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:month-1];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:yesterday];
    
    NSInteger weekday = [components weekday];
    NSString *weekdayName = [dateFormatter weekdaySymbols][weekday - 1];
    
    NSLog(@"%@, %ld %@ %ld", weekdayName, day, monthName, year);
    
    self.today = yesterday;
    
    self.dateNow.text = [NSString stringWithFormat:@"%@, %ld %@ %ld", weekdayName, day, monthName, year];
    
    // Change the data of the workout log here
    
    NSArray *workout1 = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Overloading Workout"],[[Workouts alloc]initWithName:@"Test Workout"], [[Workouts alloc]initWithName:@"Another Workout"], nil];
    NSArray *workout2 = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Just Another Workout"], [[Workouts alloc]initWithName:@"And Again Workout"], [[Workouts alloc]initWithName:@"Another Workout"], [[Workouts alloc]initWithName:@"Another Workout"], [[Workouts alloc]initWithName:@"Another Workout"], [[Workouts alloc]initWithName:@"Last Workout"], nil];
    
    self.workoutLog = [NSArray arrayWithObjects:workout1, workout2, nil];
    [self.collectionView reloadData]; // Reload/refresh the collection view

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.workoutLog.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[self.workoutLog objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"calendarCell" forIndexPath:indexPath];
    
    Workouts *list = [self.workoutLog[indexPath.section] objectAtIndex:indexPath.row];
    
    // Configure the cell
    UILabel *exerciseLabel = (UILabel *)[cell viewWithTag:1];

    [exerciseLabel setText:[list.name uppercaseString]];
    exerciseLabel.text = list.name;
    
    return cell;
}


// Set the header section
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        // Get the name of the workout for each array
        Workouts *workout = [self.routineName objectAtIndex:indexPath.section];
        // NSString *title = [[NSString alloc]initWithFormat:@"Workout Group #%li", indexPath.section + 1];
        NSString *title = workout.name;
        UILabel *headerLabel = (UILabel *)[headerView viewWithTag:5];
        headerLabel.text = title;
        reusableview = headerView;
    }
    return reusableview;
}

@end
