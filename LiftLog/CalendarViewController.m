//
//  CalendarViewController.m
//  LiftLog
//
//  Created by Christian Ing on 06/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *workout1 = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Flat Bench Press"],[[Workouts alloc]initWithName:@"Incline Dumbbell Press"], [[Workouts alloc]initWithName:@"Dumbbell Fly"], nil];
    
    NSArray *workout2 = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Barbell Shoulder Press"], [[Workouts alloc]initWithName:@"Arnold Press"], [[Workouts alloc]initWithName:@"Lateral Raises"], [[Workouts alloc]initWithName:@"Triceps Pull Down"], nil];
    
    //self.workoutLog = [NSArray arrayWithObjects:workout1, workout2, nil];
    
//    self.routineName = [NSArray arrayWithObjects:[[Workouts alloc]initWithName:@"Chest Workout"],[[Workouts alloc]initWithName:@"Shoulder Workout"], nil];
    
    [self calculateDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)calculateDate{
    self.today = [[NSDate alloc]init];
    NSDateComponents *comps = [[NSCalendar currentCalendar] components: NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger day = [comps day];
    NSInteger month = [comps month];
    NSInteger year = [comps year];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:month-1];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self.today];
    
    NSInteger weekday = [components weekday];
    NSString *weekdayName = [dateFormatter weekdaySymbols][weekday - 1];
    
    NSLog(@"%ld-%ld-%ld is a %@", day, month, year, weekdayName);
    self.dateNow.text = [NSString stringWithFormat:@"%@, %ld %@ %ld", weekdayName, day, monthName, year];
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
    NSArray *workout1 = [NSArray arrayWithObjects:[[Exercise alloc]initWithTitle:@"Shoulder Press"], nil];
    NSArray *workout2 = [NSArray arrayWithObjects:[[Exercise alloc]initWithTitle:@"Shoulder Press"], [[Exercise alloc]initWithTitle:@"Barbell Press"], nil];
    
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

// Delegate method
- (void)updateWithExercise:(NSMutableArray *)exc withSets:(NSMutableArray *)setsArray{
    NSLog(@"hello");
    self.exerciseArray = exc;
    self.setsArray = setsArray;
    [self.collectionView reloadData];
}

#pragma mark - Navigation
// Sending the selected cell data to DayViewController class
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"addWorkout"]) {
        UINavigationController *navController = [segue destinationViewController];
        AddWorkoutTableViewController *add = [navController.viewControllers objectAtIndex:0];
        add.calendarDayDelegate = self;
    }
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    /* if (self.exerciseArray.count == 0) {
        // Create a label to fit the Collection View
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, collectionView.bounds.size.width, collectionView.bounds.size.height)];
        
        // Set the message
        messageLabel.text = @"No Workout Log";
        messageLabel.textColor = [UIColor colorWithRed:(170/255.f) green:(170/255.f) blue:(170/255.f) alpha:1.0];
        [messageLabel setFont:[UIFont systemFontOfSize:25]];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [messageLabel sizeToFit]; //auto size the text
        
        // Set back to label view
        collectionView.backgroundView = messageLabel;
        
        return 0;
    }
    collectionView.backgroundView = nil; */
    return self.setsArray.count;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[self.setsArray objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"calendarCell" forIndexPath:indexPath];
    
    // Show set number, reps, and weights
    //Workouts *list = [self.workoutLog[indexPath.section] objectAtIndex:indexPath.row];
    Set *list = [self.setsArray[indexPath.section] objectAtIndex:indexPath.row];
    
    // Configure the cell
    UILabel *exerciseLabel = (UILabel *)[cell viewWithTag:1];

//    [exerciseLabel setText:[list.name uppercaseString]];
    exerciseLabel.text = [NSString stringWithFormat:@"Set %d: %@ x %@", list.setNumber, list.weight, list.reps];
    
    return cell;
}


// Set the header section
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        // Get the name of the Exercise for each array
        Exercise *exc = [self.exerciseArray objectAtIndex:indexPath.section];
        NSString *title = exc.title;
        UILabel *headerLabel = (UILabel *)[headerView viewWithTag:5];
        headerLabel.text = title;
        reusableview = headerView;
    }
    return reusableview;
}

@end
