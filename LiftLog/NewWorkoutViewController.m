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
    
    self.name.text = addWorkoutsCD.name;
    
    // remove separator for empty cells
    self.customTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    //self.workoutDays = [[NSMutableArray alloc] init];
    
    NSError *error = nil;
    
    if (![[self fetchedResultsController]performFetch:&error]) {
        NSLog(@"Error! %@", error);
        abort();
    }

}

// WIll allow to refer to managedObjectContext as self.managedObjectContext
-(NSManagedObjectContext*)managedObjectContext {
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//    addWorkoutsCD.name = _name.text;
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
        EditDayViewController *editDayViewController = segue.destinationViewController;

        RoutineDayCD *routineDayCD = [NSEntityDescription insertNewObjectForEntityForName:@"RoutineDayCD" inManagedObjectContext:[self managedObjectContext]];
        routineDayCD.workout = addWorkoutsCD;
        editDayViewController.addRoutineDayCD = routineDayCD;
        addRoutineDayCD = routineDayCD;
        addRoutineDayCD.title = @"Day Name";
    }
    
    if ([[segue identifier] isEqualToString:@"editDay"]) {
        EditDayViewController *editDayViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.customTableView indexPathForSelectedRow];
        RoutineDayCD *routineDayCD = (RoutineDayCD *)[self.fetchedResultsController objectAtIndexPath:indexPath];
        editDayViewController.addRoutineDayCD = routineDayCD;

    }


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
    NSLog(@"Add workout day pressed");
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

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.workoutDays.count;
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.workouts.count;
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"workoutDay" forIndexPath:indexPath];
    RoutineDayCD *routineDayCD = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = routineDayCD.title;
    cell.detailTextLabel.text = @"ExerciseFUCKCD Details";
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSManagedObjectContext *context = [self managedObjectContext];
        RoutineDayCD *routineDayCdToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [context deleteObject:routineDayCdToDelete];
        
        NSError *error = nil;
        
        if (![context save:&error]) {
            NSLog(@"Error!!! %@", error);
        }
        //[self.objects removeObjectAtIndex:indexPath.row];
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    /*
     else if (editingStyle == UITableViewCellEditingStyleInsert) {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
     }
     */
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *CellIdentifier = @"workoutDay";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    RoutineDay *day = [self.workoutDays objectAtIndex:indexPath.row];
//    cell.textLabel.text = day.title;
//    
//    return cell;
//}

#pragma mark - Fetched Results Controller Section

-(NSFetchedResultsController*)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"RoutineDayCD" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"title" ascending:YES];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"workout = %@", addWorkoutsCD];
    
    [fetchRequest setPredicate:predicate];
    
    NSArray *sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    
    fetchRequest.sortDescriptors = sortDescriptors;
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    
    _fetchedResultsController.delegate = self;
    
    //[[self.fetchedResultsController sections]count]
    NSLog(@"_fetchedResultsController.fetchedObjects.count = %lu", _fetchedResultsController.fetchedObjects.count);
    
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
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate: {
            RoutineDayCD *changeRoutineDayCD = [self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = changeRoutineDayCD.title;
        }
            break;
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    //UITableView *tableView = self.customTableView;
    
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
