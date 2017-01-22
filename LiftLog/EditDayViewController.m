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
        create.setArray = self.setArrays;
        //add.day = [self.workoutDays objectAtIndex:[self.customTableView indexPathForSelectedRow].row];
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exerciseArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exerciseCell" forIndexPath:indexPath];
    Exercise *exc = [self.exerciseArray objectAtIndex:indexPath.row];
    cell.textLabel.text = exc.title;
    
    return cell;
}

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
@end
