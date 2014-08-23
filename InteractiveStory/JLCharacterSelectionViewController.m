//
//  CharacterSelectionViewController.m
//  InteractiveStory
//
//  Created by Johnny Lee on 11/24/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import "JLCharacterSelectionViewController.h"

#import "JLCharacter.h"
#import "JLArchetype.h"
#import "JLCharacterCell.h"
#import "JLArchetypeDescriptionReusableView.h"

@interface JLCharacterSelectionViewController ()

@property (strong, nonatomic) IBOutlet UIBarButtonItem *actionBarButtonItem;
- (IBAction)nextAction:(id)sender;
- (IBAction)unwind:(UIStoryboardSegue *)segue;

@end

@implementation JLCharacterSelectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    JLArchetype *archetype = [JLArchetype allArchetypes][self.currentArchetype];
    self.navigationItem.title = archetype.name;
    self.collectionView.allowsMultipleSelection = YES;
//    self.clearsSelectionOnViewWillAppear = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.rightBarButtonItem = nil;
    NSArray *selectedIndexPaths = self.collectionView.indexPathsForSelectedItems;
    for (NSIndexPath *indexPath in selectedIndexPaths) {
        JLCharacterCell *cell = (JLCharacterCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        NSLog(@"Cell for %@ is selected", cell.character.name);
        if ([[JLCharacter availableCharacters] containsObject:cell.character] == NO) {
            [[JLCharacter availableCharacters] addObject:cell.character];
        }

        JLArchetype *archetype = [JLArchetype allArchetypes][self.currentArchetype];
        archetype.characters = nil;
        [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
    }
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Collection view data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return [[JLCharacter availableCharacters] count];
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView
                   cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Character Cell";
    JLCharacterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                      forIndexPath:indexPath];
    JLCharacter *character = [JLCharacter availableCharacters][indexPath.row];
    cell.character = character;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{

    if (kind == UICollectionElementKindSectionHeader) {
        static NSString *headerName = @"Archetype Description Header";
        JLArchetypeDescriptionReusableView *header = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                             withReuseIdentifier:headerName
                                                                                                    forIndexPath:indexPath];
        JLArchetype *archetype = [JLArchetype allArchetypes][self.currentArchetype];
        header.archetypeDescriptionLabel.text = archetype.description;
        return header;
    } else {
        return nil;
    }
}


#pragma mark - Collection view delegate

- (void)  collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.navigationItem.rightBarButtonItem = self.actionBarButtonItem;
    JLArchetype *archetype = [JLArchetype allArchetypes][self.currentArchetype];
    NSArray *selectedIndexPaths = [self.collectionView indexPathsForSelectedItems];
    
    if ([selectedIndexPaths count] == archetype.characterCount) {
        for (NSIndexPath *indexPath in selectedIndexPaths) {
            JLCharacter *character = [JLCharacter availableCharacters][indexPath.row];
            [[JLCharacter availableCharacters] removeObject:character];
            JLArchetype *archetype = [JLArchetype allArchetypes][self.currentArchetype];
            [archetype.characters addObject:character];
            NSLog(@"just added character: %@", character.name);
            NSLog(@"Characters in archetype %@: %@", archetype.name, archetype.characters);
        }
        
        if (self.currentArchetype + 1 == [[JLArchetype allArchetypes] count]) {
            [self performSegueWithIdentifier:@"Start Writing" sender:self];
        } else {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
            JLCharacterSelectionViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"SelectCharacterVC"];
            viewController.currentArchetype = self.currentArchetype + 1;

            [self.navigationController pushViewController:viewController animated:YES];
        }
    }
}

- (void)    collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[collectionView indexPathsForSelectedItems] count] == 0) {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

#pragma mark - View controller

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"Select Next Role"]) {
        JLArchetype *archetype = [JLArchetype allArchetypes][self.currentArchetype];
        NSUInteger selectedCount = [[self.collectionView indexPathsForSelectedItems] count];
        if (selectedCount == archetype.characterCount) {
            if (self.currentArchetype + 1 == [[JLArchetype allArchetypes] count]) {
                return NO;
            } else {
                return YES;
            }
        } else if (sender == self.actionBarButtonItem) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
//    if ([segue.identifier isEqualToString:@"Select Next Role"]) {
//        JLCharacterSelectionViewController *viewController = segue.destinationViewController;
//        viewController.currentArchetype = self.currentArchetype + 1;
//        NSArray *selectedIndexPaths = self.collectionView.indexPathsForSelectedItems;
//        NSLog(@"selected index paths %@", selectedIndexPaths);
//
//        for (NSIndexPath *indexPath in selectedIndexPaths) {
//            JLCharacter *character = [JLCharacter availableCharacters][indexPath.row];
//            [[JLCharacter availableCharacters] removeObject:character];
//            JLArchetype *archetype = [JLArchetype allArchetypes][self.currentArchetype];
//            [archetype.characters addObject:character];
//            NSLog(@"just added character: %@", character.name);
//            NSLog(@"Characters in archetype %@: %@", archetype.name, archetype.characters);
//        }
//    }
}


#pragma mark - Actions

- (IBAction)nextAction:(id)sender
{
    NSArray *selectedIndexPaths = [self.collectionView indexPathsForSelectedItems];
    for (NSIndexPath *indexPath in selectedIndexPaths) {
        JLCharacter *character = [JLCharacter availableCharacters][indexPath.row];
        [[JLCharacter availableCharacters] removeObject:character];
        JLArchetype *archetype = [JLArchetype allArchetypes][self.currentArchetype];
        [archetype.characters addObject:character];
        NSLog(@"just added character: %@", character.name);
        NSLog(@"Characters in archetype %@: %@", archetype.name, archetype.characters);
    }
    
    if (self.currentArchetype + 1 == [[JLArchetype allArchetypes] count]) {
        [self performSegueWithIdentifier:@"Start Writing" sender:self];
    } else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        JLCharacterSelectionViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"SelectCharacterVC"];
        viewController.currentArchetype = self.currentArchetype + 1;
        
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (IBAction)unwind:(UIStoryboardSegue *)segue
{
    
}

@end
