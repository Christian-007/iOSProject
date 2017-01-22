//
//  CreateSetViewController.m
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "CreateSetViewController.h"

@interface CreateSetViewController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;


@end

@implementation CreateSetViewController

@synthesize addSetCD, selectedSetCD;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSError *error = nil;
    
    if (![[self fetchedResultsController]performFetch:&error]) {
        NSLog(@"Error! %@", error);
        abort();
    }
    
    self.newset.layer.cornerRadius = 20;
    self.newset.clipsToBounds = YES;
    
    self.setArray = [[NSMutableArray alloc]init];
    //ExerciseCD *exe;
    NSLog(@" Exercise Title %@", self.exerciseCD.title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //self.setLabel.text = [NSString stringWithFormat:@"%d", (int)self.sets.setNumber];
    //self.weightLabel.text = [NSString stringWithFormat:@"%@ kgs", self.sets.weight];
    //self.repsLabel.text = [NSString stringWithFormat:@"%@", self.sets.reps];
    [self.customTableView reloadData];
}

-(NSManagedObjectContext*)managedObjectContext {
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    if ([[segue identifier] isEqualToString:@"addSet"]) {
        SetCD *setCD = [NSEntityDescription insertNewObjectForEntityForName:@"SetCD" inManagedObjectContext:[self managedObjectContext]];
        setCD.exercise = self.exerciseCD;
        NSLog(@"Set Successfully created!");
        self.addSetCD = setCD;

        self.addSetCD.reps = @"0";
        self.addSetCD.weight = @"0";
        
        [self.customTableView reloadData];
        NSLog(@"Number of Sections %lu", [[self.fetchedResultsController sections]count]);
        
        //self.addSetCD.exercise
        //self.addSetCD.exercise = //
        //self.addSetCD.setNumber;
        
        
        
        //[self.setArray addObject:[[Set alloc]initWithSetNumber:(int)self.setArray.count+1 withReps:@"10" withWeight:@"20"]];
        
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.fetchedResultsController.fetchedObjects.count-1 inSection:0];
//        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
//        [self.customTableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
//        [self.customTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
//        
//        EditSetViewController *e = [segue destinationViewController];
//        self.sets = [self.setArray objectAtIndex:[self.customTableView indexPathForSelectedRow].row];
//        e.set = self.sets;
    }
    if ([[segue identifier] isEqualToString:@"showSet"]) {
        EditSetViewController *e = [segue destinationViewController];
        self.sets = [self.setArray objectAtIndex:[self.customTableView indexPathForSelectedRow].row];
        e.set = self.sets;
    }

}

- (IBAction)addSet:(id)sender {
    [self performSegueWithIdentifier:@"addSet" sender:self];
}

- (IBAction)doneClicked:(id)sender {
    // Send data back to prev ViewController through delegate
    [self.workoutDayDelegate updateWithExercise:self.exercise withSets:self.setArray];
    
    // Pop back to previous ViewController
    NSArray *array = [self.navigationController viewControllers];
    [self.navigationController popToViewController:[array objectAtIndex:1] animated: YES];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView = %lu", [[self.fetchedResultsController sections]count]);
    return [[self.fetchedResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.workouts.count;
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    SetCD *setCD = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    self.setLabel = (UILabel *)[cell viewWithTag:1];
    self.weightLabel = (UILabel *)[cell viewWithTag:2];
    self.repsLabel = (UILabel *)[cell viewWithTag:3];
    
    self.setLabel.text = [NSString stringWithFormat:@"%d", (int)setCD.setNumber];
    self.weightLabel.text = [NSString stringWithFormat:@"%@ kgs", setCD.weight];
    self.repsLabel.text = [NSString stringWithFormat:@"%@", setCD.reps];

    
    //cell.textLabel.text = setCd.name;
    //cell.detailTextLabel.text = @"WorkoutsCD Details";
    return cell;
}

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.setArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setCell" forIndexPath:indexPath];
    
    Set *set = [self.setArray objectAtIndex:indexPath.row];
    
    self.setLabel = (UILabel *)[cell viewWithTag:1];
    self.weightLabel = (UILabel *)[cell viewWithTag:2];
    self.repsLabel = (UILabel *)[cell viewWithTag:3];
    
    self.setLabel.text = [NSString stringWithFormat:@"%d", (int)set.setNumber];
    self.weightLabel.text = [NSString stringWithFormat:@"%@ kgs", set.weight];
    self.repsLabel.text = [NSString stringWithFormat:@"%@", set.reps];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"Weight: %@ kgs Reps: %@", set.weight, set.reps];
    
    return cell;
}*/

# pragma mark - Fetched Results Controller Section

-(NSFetchedResultsController*)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    
    NSManagedObjectContext *context = self.managedObjectContext;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SetCD" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"reps" ascending:YES];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"exercise = %@", self.exerciseCD];
    
    [fetchRequest setPredicate:predicate];
    
    NSArray *sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    
    fetchRequest.sortDescriptors = sortDescriptors;
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    
    _fetchedResultsController.delegate = self;
    NSLog(@"_fetchedResultsController.fetchedObjects.count = %lu", _fetchedResultsController.fetchedObjects.count);
    
    NSMutableArray *array = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    for (NSManagedObject *obj in array) {
        NSLog(@"reps: %@\n", [obj valueForKey:@"reps"]);
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
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate: {
            NSLog(@"NSFetchedResultsChangeUpdate:");
            SetCD *changeSetCD = [self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            //cell.textLabel.text = changeRoutineDayCD.title;
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
