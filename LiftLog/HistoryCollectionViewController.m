//
//  HistoryCollectionViewController.m
//  LiftLog
//
//  Created by Christian Ing on 05/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "HistoryCollectionViewController.h"
#import "WorkoutDetailViewController.h"
#import "Workouts.h"

@interface HistoryCollectionViewController () {
}

@end

@implementation HistoryCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.workouts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Workouts *list = [self.workouts objectAtIndex:indexPath.row];
    
    // Configure the cell
    //UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    //recipeImageView.image = [UIImage imageNamed:list.name];
    
    UIView *viewLayer = (UIView *)[cell viewWithTag:2];
    viewLayer.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1].CGColor;
    viewLayer.layer.borderWidth = 1.0f;
    
    UILabel *recipeLabel = (UILabel *)[cell viewWithTag:1];
    //[recipeLabel setText:[list.name uppercaseString]];
    recipeLabel.text = list.name;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"showWorkout"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
        Workouts *workout = [self.workouts objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem: workout];
    }
}

@end
