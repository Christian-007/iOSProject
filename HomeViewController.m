//
//  HomeViewController.m
//  LiftLog
//
//  Created by Christian Ing on 07/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "NewWorkoutViewController.h"
#import "WorkoutsCD.h"
#import "ViewWorkoutDaysTableViewController.h"

#import "Workouts.h"

@interface HomeViewController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property NSMutableArray *objects;
@end

@implementation HomeViewController

@synthesize workoutsCD;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error = nil;
    
    if (![[self fetchedResultsController]performFetch:&error]) {
        NSLog(@"Error! %@", error);
        abort();
    }
    
    // set the new workout button to have rounded edges
    self.create.layer.cornerRadius = 20;
    self.create.clipsToBounds = YES;
    
    // remove separator for empty cells
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    //NSLog(@"%lu", (unsigned long)self.workouts.count);
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createNewWorkout:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void) viewWillAppear:(BOOL)animated {
    
    [self.tableView reloadData];
}

// WIll allow to refer to managedObjectContext as self.managedObjectContext
-(NSManagedObjectContext*)managedObjectContext {
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%d", ([[segue identifier] isEqualToString:@"createWorkout"]));
    if ([[segue identifier] isEqualToString:@"createWorkout"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        NewWorkoutViewController *addNewWorkoutViewController = (NewWorkoutViewController*) navigationController.topViewController;
        
        WorkoutsCD *addWorkoutsCD = [NSEntityDescription insertNewObjectForEntityForName:@"WorkoutsCD" inManagedObjectContext:[self managedObjectContext]];
    
        addWorkoutsCD.name = @"RoutineName";
        addNewWorkoutViewController.addWorkoutsCD = addWorkoutsCD;
    }
    // viewWorkoutDays
    if ([[segue identifier] isEqualToString:@"viewWorkoutDays"]) {
        /*ViewWorkoutDaysTableViewController *viewWorkoutDaysTableViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        WorkoutsCD *selectedWorkoutsCD = (WorkoutsCD*)[self.fetchedResultsController objectAtIndexPath:indexPath];
        viewWorkoutDaysTableViewController.selectedWorkoutDaysCD = selectedWorkoutsCD;*/
        UINavigationController *navigationController = segue.destinationViewController;
        NewWorkoutViewController *addNewWorkoutViewController = (NewWorkoutViewController*) navigationController.topViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        WorkoutsCD *selectedWorkoutsCD = (WorkoutsCD*)[self.fetchedResultsController objectAtIndexPath:indexPath];

        addNewWorkoutViewController.addWorkoutsCD = selectedWorkoutsCD;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNewWorkout:(id)sender {
    [self performSegueWithIdentifier:@"createWorkout" sender:self];
}

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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    WorkoutsCD *workoutsCD = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = workoutsCD.name;
    cell.detailTextLabel.text = @"WorkoutsCD Details";
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSManagedObjectContext *context = [self managedObjectContext];
        WorkoutsCD *workoutCdToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [context deleteObject:workoutCdToDelete];
        
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

- (IBAction)createClicked:(id)sender {
    
}

#pragma mark - Fetched Results Controller Section

-(NSFetchedResultsController*)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"WorkoutsCD" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    
    NSArray *sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    
    fetchRequest.sortDescriptors = sortDescriptors;
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    
    _fetchedResultsController.delegate = self;
    
    //[[self.fetchedResultsController sections]count]
    //NSLog(@"_fetchedResultsController.fetchedObjects.count = %lu", _fetchedResultsController.fetchedObjects.count);
    
    return _fetchedResultsController;
}

#pragma mark - Fetched Results Controller Delegates

-(void) controllerWillChangeContent:(NSFetchedResultsController *) controller {
    [self.tableView beginUpdates];
}

-(void) controllerDidChangeContent:(NSFetchedResultsController *) controller {
    [self.tableView endUpdates];
}

-(void) controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate: {
            WorkoutsCD *changeWorkoutCD = [self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = changeWorkoutCD.name;
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
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}



@end
