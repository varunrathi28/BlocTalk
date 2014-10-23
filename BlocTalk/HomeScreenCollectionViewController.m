//
//  HomeScreenCollectionViewController.m
//  BlocTalk
//
//  Created by Murphy on 10/8/14.
//  Copyright (c) 2014 Murphy. All rights reserved.
//

#import "HomeScreenCollectionViewController.h"
#import "HomeScreenCollectionViewCell.h"
#import "DataSource.h"
#import "Contact.h"
#import "ConversationViewController.h"
@import AddressBook;

@interface HomeScreenCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation HomeScreenCollectionViewController

{
    NSArray *activeConverstations; 
}

static NSString * const reuseIdentifier = @"contactCollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Contact *cell1 = [Contact new];
    cell1.firstName = @"Jane D";
    cell1.thumbnailImage = @"1.jpg";
    
    Contact *cell2 = [Contact new];
    cell2.firstName = @"Peter R";
    cell2.thumbnailImage = @"2.jpg";
    
    Contact *cell3 = [Contact new];
    cell3.firstName = @"Mason P";
    cell3.thumbnailImage = @"3.jpg";
    
    Contact *cell4 = [Contact new];
    cell4.firstName = @"John S";
    cell4.thumbnailImage = @"4.jpg";
    
    activeConverstations = [NSArray arrayWithObjects:cell1, cell2, cell3, cell4, nil];
    self.clearsSelectionOnViewWillAppear = NO;
    self.selectedPersonName = @"";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:nil];
    self.navigationItem.rightBarButtonItem = editButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // once we verify this works, we can look up the first selected cell and get the name from it here.
    NSIndexPath *path = [[self.collectionView indexPathsForSelectedItems] lastObject];
    
    
    // This doesn't work because data source is not yet providing data, at least in this branch.
    //    Contact *person = [[DataSource sharedInstance].contactList objectAtIndex:path.row];
    
    NSString *name = [(Contact *)activeConverstations[path.row] firstName];

    NSLog(@"Going to path for cell %ld (%@)",(long)path.row,name);

    [(ConversationViewController*)[segue destinationViewController] setPersonName:name];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger itemsCount = [DataSource sharedInstance].activeConverstations.count;
    itemsCount = 4;
    NSLog(@"Got %d items",(int)itemsCount);
    return itemsCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeScreenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // UIImageView *cellIcon = (UIImageView*)[cell viewWithTag:101];
    // cell.cellImage.image = (indexPath.row % 2 ? [UIImage imageNamed:@"1"] : [UIImage imageNamed:@"2"]);
    Contact *activeConversation = [DataSource sharedInstance].activeConverstations[indexPath.row];
    cell.cellImage.image = [UIImage imageNamed:activeConversation.thumbnailImage];
    cell.cellNameLabel.text = activeConversation.firstName;
    cell.backgroundColor = [UIColor whiteColor];
    // This is just for debug reference - not needed for production
    cell.cellId = indexPath.row;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSObject *itemData = [[collectionView dataSource] getDataForPath:indexPath];
    Contact *activeConversation = [activeConverstations objectAtIndex:indexPath.row];
    self.selectedPersonName = activeConversation.firstName;
     NSLog(@"You selected item %@ - %@",[indexPath description], self.selectedPersonName);
    
}

@end
