//
//  CalendarViewController.m
//  LiftLog
//
//  Created by Christian Ing on 06/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation CalendarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSError *error = nil;
    
    if (![[self fetchedResultsController]performFetch:&error]) {
        NSLog(@"Error! %@", error);
        abort();
        
        
    }
    
    [self calculateDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
    NSError *error = nil;
    
    if (![[self fetchedResultsController]performFetch:&error]) {
        NSLog(@"Error! %@", error);
        abort();
        
        
    }

    [super viewDidAppear:animated];
    [self.customTableView reloadData];
}

-(void) viewWillAppear:(BOOL)animated {
    NSError *error = nil;
    
    if (![[self fetchedResultsController]performFetch:&error]) {
        NSLog(@"Error! %@", error);
        abort();
    }
    
    [self.customTableView reloadData];
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
    [self.customTableView reloadData]; // Reload/refresh the collection view
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
    [self.customTableView reloadData]; // Reload/refresh the collection view

}

-(NSManagedObjectContext*)managedObjectContext {
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
}


#pragma mark - Navigation
// Sending the selected cell data to DayViewController class
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"addWorkout"]) {
        UINavigationController *navController = [segue destinationViewController];
        AddWorkoutTableViewController *addWorkoutTableViewController = [navController.viewControllers objectAtIndex:0];
        
        WorkoutsCalendar *calendar = [NSEntityDescription insertNewObjectForEntityForName:@"WorkoutsCalendar" inManagedObjectContext:[self managedObjectContext]];
        calendar.cdate = self.today;
        addWorkoutTableViewController.workCalendar = calendar;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"section: %lu", [[_fetchedResultsController sections]count]);
    return [[_fetchedResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.workouts.count;
    id<NSFetchedResultsSectionInfo> sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
    //NSLog(@"section: %lu", [elf.fetchedResultsController sections]count]);
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    WorkoutsCalendar *calendar = [_fetchedResultsController objectAtIndexPath:indexPath];
   
    NSLog(@"Workout: %@", calendar.name);
    cell.textLabel.text = calendar.name;
    //cell.detailTextLabel.text = @"WorkoutsCD Details";
    return cell;
}


#pragma mark - Fetched Results Controller Section

-(NSFetchedResultsController*)fetchedResultsController {
    NSLog(@"fetchedResults TOP");
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"WorkoutsCalendar" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    
    NSArray *sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    
    fetchRequest.sortDescriptors = sortDescriptors;
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];

    _fetchedResultsController.delegate = self;
    
    
    NSMutableArray *array = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSLog(@"*****FETCHED RESULTS******");
    for (NSManagedObject *obj in array) {
        NSLog(@"name: %@\n", [obj valueForKey:@"name"]);
    }
    

    
    return _fetchedResultsController;
}

#pragma mark - Fetched Results Controller Delegates

-(void) controllerWillChangeContent:(NSFetchedResultsController *) controller {
    [self.customTableView beginUpdates];
}

-(void) controllerDidChangeContent:(NSFetchedResultsController *) controller {
    [self.customTableView endUpdates];
}

-(void) controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.customTableView;
    NSLog(@"case NSFetchedResultsChangeUpdate: type");
    switch (type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate: {
            //NSLog(@"case NSFetchedResultsChangeUpdate: printed");
            WorkoutsCalendar *changeWorkoutCalendar = [_fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = changeWorkoutCalendar.name;
            //NSLog(@"case NSFetchedResultsChangeUpdate: not printed");
        }
            break;
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.customTableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.customTableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}



@end
