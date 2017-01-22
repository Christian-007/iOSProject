//
//  CoreViewController.m
//  LiftLog
//
//  Created by Andrejus Skulis on 21/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "CoreViewController.h"
#import "AppDelegate.h"

@interface CoreViewController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation CoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// Allow access to Core Data stack. Will allow to refer to managedObjectContext as self.managedObjectContext
-(NSManagedObjectContext*)managedObjectContext {
    return [(AppDelegate*)[[UIApplication sharedApplication]delegate]managedObjectContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Removes created object and dismisses the current ViewController
- (void)cancelAndDismiss {
    [self.managedObjectContext rollback];
    NSLog(@"cancelAndDismiss pressed");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveAndDismiss {

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
