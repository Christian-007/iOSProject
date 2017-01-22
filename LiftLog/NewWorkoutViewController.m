//
//  NewWorkoutViewController.m
//  LiftLog
//
//  Created by Christian Ing on 10/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "NewWorkoutViewController.h"
#import "Workouts.h"
#import "DayViewController.h"
#import "RoutineDay.h"
#import "AppDelegate.h"
#import "EditDayViewController.h"

@interface NewWorkoutViewController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation NewWorkoutViewController

@synthesize workoutDays;
@synthesize addWorkoutsCD, addRoutineDayCD;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.customTableView setHidden:YES];
    
    // remove separator for empty cells
    self.customTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.workoutDays = [[NSMutableArray alloc] init];

}

// WIll allow to refer to managedObjectContext as self.managedObjectContext
-(NSManagedObjectContext*)managedObjectContext {
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    addWorkoutsCD.name = _name.text;
    NSError *error = nil;
    if ([self.managedObjectContext hasChanges]) {
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"WorkoutsCD Save Failed: %@", [error localizedDescription]);
        } else {
            NSLog(@"WorkoutsCD Save Succeeded");
        }
    }

    
    NSLog(@"%d", ([[segue identifier] isEqualToString:@"addDay"]));
    if ([[segue identifier] isEqualToString:@"addDay"]) {
        //UINavigationController *navigationController = segue.destinationViewController;
        EditDayViewController *editDayViewController = segue.destinationViewController;

        RoutineDayCD *routineDayCD = [NSEntityDescription insertNewObjectForEntityForName:@"RoutineDayCD" inManagedObjectContext:[self managedObjectContext]];
        routineDayCD.workout = addWorkoutsCD;
        editDayViewController.addRoutineDayCD = routineDayCD;
        //addWorkoutsCD.rou = routineDayCD;
    }
    // viewWorkoutDays
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated]; // resets the highlighted cell bg colour
    [self.customTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Dismisses the current view (modal) without saving any changes
- (IBAction)cancelClicked:(id)sender {
    /*
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
     */
    //[super cancelAndDismiss];
    [self.managedObjectContext rollback];
    NSLog(@"cancelAndDismiss pressed");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

// Add a new workout day
- (IBAction)addWorkoutDay:(id)sender {
    /*
    [self.workoutDays addObject:[[RoutineDay alloc]initWithDay:[NSString stringWithFormat:@"Day %lu", self.workoutDays.count+1]]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.workoutDays.count-1 inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    if (self.workoutDays.count > 0 && self.customTableView.isHidden == YES) {
        [self.customTableView setHidden:NO];
    }
    [self.customTableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
    [self.customTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle]; // select the index of newly created cell
    [self performSegueWithIdentifier:@"editDay" sender:self];
     */
    //[self.managedObjectContext rollback];
    NSLog(@"Add workout day pressed");
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"addDay" sender:self];
}

- (IBAction)save:(UIBarButtonItem *)sender {
    addWorkoutsCD.name = _name.text;
    NSError *error = nil;
    if ([self.managedObjectContext hasChanges]) {
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Save Failed: %@", [error localizedDescription]);
        } else {
            NSLog(@"Save Succeeded");
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

// Sending the selected cell data to DayViewController class


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.workoutDays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"workoutDay";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    RoutineDay *day = [self.workoutDays objectAtIndex:indexPath.row];
    cell.textLabel.text = day.title;
    
    return cell;
}

@end
