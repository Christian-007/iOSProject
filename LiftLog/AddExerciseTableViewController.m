//
//  AddExerciseTableViewController.m
//  LiftLog
//
//  Created by Christian Ing on 11/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "AddExerciseTableViewController.h"
#import "CreateSetViewController.h"

@interface AddExerciseTableViewController ()

@end

@implementation AddExerciseTableViewController

@synthesize addExerciseCD,addSetCD;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.exerciseArray = [NSArray arrayWithObjects:[[ExerciseCD alloc]initWithTitle:@"Chest Exercise"], [[ExerciseCD alloc]initWithTitle:@"Shoulder Exercise"], [[ExerciseCD alloc]initWithTitle:@"Legs Exercise"], [[ExerciseCD alloc]initWithTitle:@"Arm Exercise"], nil];

    self.exerciseCDArray = @[@"Chest Exercise", @"Shoulder Exercise", @"Legs Exercise", @"Arm Exercise"];
    //NSArray *myArray = @[@"1", @"2", @"3", @"4", @"5"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exerciseCDArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exerciseCell" forIndexPath:indexPath];
    
    // Configure the cell...
    //Exercise *exc = [self.exerciseCDArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [self.exerciseCDArray objectAtIndex:indexPath.row];
    return cell;
}

-(NSManagedObjectContext*)managedObjectContext {
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

 #pragma mark - Navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     NSLog(@"AddExercise... segue");
     
     if ([[segue identifier] isEqualToString:@"editExercise"]) {
         CreateSetViewController *addCreateSetViewController = [segue destinationViewController];
         
         self.addExerciseCD.title = [self.exerciseCDArray objectAtIndex:[self.tableView indexPathForSelectedRow].row];
         NSLog(@"Excercise = %@", self.addExerciseCD.title);
         
         addCreateSetViewController.exerciseCD = self.addExerciseCD;
//         SetCD *setCD = [NSEntityDescription insertNewObjectForEntityForName:@"SetCD" inManagedObjectContext:[self managedObjectContext]];
//         setCD.exercise = addExerciseCD;
//         NSLog(@"Set Successfully created!");
//         
//         
//         //addCreateSetViewController.workoutDayDelegate = self.workoutDayDelegate;
//         //addCreateSetViewController.exercise = [self.exerciseArray objectAtIndex:[self.tableView indexPathForSelectedRow].row];
//         
//         addCreateSetViewController.addSetCD = setCD;
         NSLog(@"AddExercise... segue finished");

     }
     
    
     
    
     
     
  /*   if ([[segue identifier] isEqualToString:@"addExercise"]) {
         AddExerciseTableViewController *add = [segue destinationViewController];
         add.workoutDayDelegate = self;
         //add.day = [self.workoutDays objectAtIndex:[self.customTableView indexPathForSelectedRow].row];
         
         
         AddExerciseTableViewController *addExerciseTableViewController = segue.destinationViewController;
         
         ExerciseCD *exerciseCD = [NSEntityDescription insertNewObjectForEntityForName:@"ExerciseCD" inManagedObjectContext:[self managedObjectContext]];
         
         exerciseCD.routineday = addRoutineDayCD;
         addExerciseTableViewController.addExerciseCD = exerciseCD;
         
     }
   */

 }


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
