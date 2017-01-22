//
//  EditDayViewController.m
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "EditDayViewController.h"

@interface EditDayViewController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end

@implementation EditDayViewController

@synthesize addRoutineDayCD, addExerciseCD;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initialise exercise array
    self.exerciseArray = [[NSMutableArray alloc]init];
    [self.exerciseArray addObject:[[Exercise alloc]initWithTitle:@"Test"]];
    self.setArrays = [[NSMutableArray alloc]init];
    
    // set the add exercise button to have rounded edges
    self.addbutton.layer.cornerRadius = 20;
    self.addbutton.clipsToBounds = YES;
    
    self.navigationItem.title = self.day.title;
    self.navigationController.view.backgroundColor = [UIColor whiteColor]; // remove annoying dark gray bg color during segue transition
    
    NSError *error = nil;
    
        if (![[self fetchedResultsController]performFetch:&error]) {
            NSLog(@"Error! %@", error);
            abort();
        }

}

-(void) viewWillAppear:(BOOL)animated {
    
    [self.customTableView reloadData];
}


-(NSManagedObjectContext*)managedObjectContext {
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// Sending the selected cell data to DayViewController class
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //addWorkoutsCD.name = _name.text;
    addRoutineDayCD.title = self.routineDayTextField.text;
    NSError *error = nil;
    if ([self.managedObjectContext hasChanges]) {
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"RoutineDay Save Failed: %@", [error localizedDescription]);
        } else {
            NSLog(@"RoutineDayCD Save Succeeded");
        }
    }
    
    
    if ([[segue identifier] isEqualToString:@"addExercise"]) {
        AddExerciseTableViewController *add = [segue destinationViewController];
        add.workoutDayDelegate = self;
        //add.day = [self.workoutDays objectAtIndex:[self.customTableView indexPathForSelectedRow].row];
        
        
        AddExerciseTableViewController *addExerciseTableViewController = segue.destinationViewController;
        
        ExerciseCD *exerciseCD = [NSEntityDescription insertNewObjectForEntityForName:@"ExerciseCD" inManagedObjectContext:[self managedObjectContext]];
        
        exerciseCD.routineday = addRoutineDayCD;
        addExerciseTableViewController.addExerciseCD = exerciseCD;
        
    }
    if ([[segue identifier] isEqualToString:@"editExercise"]) {
        CreateSetViewController *create = [segue destinationViewController];
        NSIndexPath *indexPath = [self.customTableView indexPathForSelectedRow];

        ExerciseCD *exerciseCD = (ExerciseCD *)[self.fetchedResultsController objectAtIndexPath:indexPath];

        NSLog(@"Number of Exercises %lu", [[self.fetchedResultsController sections]count]);
        create.exerciseCD = exerciseCD;
        
        //add.day = [self.workoutDays objectAtIndex:[self.customTableView indexPathForSelectedRow].row];
    }

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

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
 
 // Configure the cell...
 Workouts *workout = [self.workouts objectAtIndex:indexPath.row];
 cell.textLabel.text = workout.name;
 cell.detailTextLabel.text = @"2 Exercises";
 return cell;
 }
 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exerciseCell" forIndexPath:indexPath];
    ExerciseCD *exerciseCD = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = exerciseCD.title;
    cell.detailTextLabel.text = @"ExerciseCD Details";
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSManagedObjectContext *context = [self managedObjectContext];
        ExerciseCD *workoutCdToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
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


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.exerciseArray.count;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exerciseCell" forIndexPath:indexPath];
//    Exercise *exc = [self.exerciseArray objectAtIndex:indexPath.row];
//    cell.textLabel.text = exc.title;
//    
//    return cell;
//}

- (IBAction)addExerciseButton:(id)sender {
    
    [self performSegueWithIdentifier:@"addExercise" sender:self];
}

- (void)updateWithExercise:(Exercise *)exc withSets:(NSMutableArray *)setsArray{
    NSLog(@"Calling an update method of delegate...");
    NSLog(@"%@", self);
    NSLog(@"exercise title: %@", exc.title);
    self.setArrays = setsArray;
    for (Set *s in self.setArrays) {
        NSLog(@"reps: %@", s.reps);
        NSLog(@"weight: %@", s.weight);
    }
    [self.exerciseArray addObject:exc];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.exerciseArray.count-1 inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.customTableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
}

#pragma mark - Fetched Results Controller Section

-(NSFetchedResultsController*)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ExerciseCD" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"title" ascending:YES];
    
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
            ExerciseCD *changeExerciseCD = [self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = changeExerciseCD.title;
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
