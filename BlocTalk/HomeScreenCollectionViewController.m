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
#import "ContactList.h"

@interface HomeScreenCollectionViewController ()

@end

@implementation HomeScreenCollectionViewController

{
    NSArray *activeConverstations;
}

static NSString * const reuseIdentifier = @"contactCollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ContactList *cell1 = [ContactList new];
    cell1.name = @"Jane D";
    cell1.thumbnailImage = @"1.jpg";
    
    ContactList *cell2 = [ContactList new];
    cell2.name = @"Peter R";
    cell2.thumbnailImage = @"2.jpg";
    
    ContactList *cell3 = [ContactList new];
    cell3.name = @"Mason P";
    cell3.thumbnailImage = @"3.jpg";
    
    ContactList *cell4 = [ContactList new];
    cell4.name = @"John S";
    cell4.thumbnailImage = @"4.jpg";
    
    activeConverstations = [NSArray arrayWithObjects:cell1, cell2, cell3, cell4, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger itemsCount = [DataSource sharedInstance].contactList.count;
    itemsCount = 4;
    NSLog(@"Got %d items",(int)itemsCount);
    return itemsCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeScreenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    
    // UIImageView *cellIcon = (UIImageView*)[cell viewWithTag:101];
    // cell.cellImage.image = (indexPath.row % 2 ? [UIImage imageNamed:@"1"] : [UIImage imageNamed:@"2"]);
    ContactList *activeConversation = [activeConverstations objectAtIndex:indexPath.row];
    cell.cellImage.image = [UIImage imageNamed:activeConversation.thumbnailImage];
    cell.cellNameLabel.text = activeConversation.name;
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

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
    NSLog(@"You selected item %@ - %@",[indexPath description], @"-");
}
@end