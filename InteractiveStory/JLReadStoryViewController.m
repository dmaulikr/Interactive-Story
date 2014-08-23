//
//  JLReadStoryViewController.m
//  InteractiveStory
//
//  Created by Johnny Lee on 11/26/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import "JLReadStoryViewController.h"

#import "JLCharacterCell.h"
#import "JLArchetype.h"
#import "JLCharacter.h"
#import "JLStorySectionHeader.h"
#import "JLStorySectionFooter.h"
#import "JLStoryChunk.h"

@interface JLReadStoryViewController () <UIAlertViewDelegate>

- (IBAction)exitAction:(id)sender;

@end

@implementation JLReadStoryViewController

#pragma mark - Collection view data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSUInteger count = [[JLArchetype allArchetypes] count];
    return count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    JLArchetype *archetype = [JLArchetype allArchetypes][section];
    NSUInteger count = [archetype.characters count];
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Character Cell";
    JLCharacterCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellName
                                                                           forIndexPath:indexPath];
    JLArchetype *archetype = [JLArchetype allArchetypes][indexPath.section];
    JLCharacter *character = archetype.characters[indexPath.row];
    cell.character = character;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    JLStoryChunk *chunk = [JLStoryChunk storyChunks][indexPath.section];
    if (kind == UICollectionElementKindSectionHeader) {
        static NSString *headerName = @"Story Chunk Header";
        JLStorySectionHeader *header = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerName forIndexPath:indexPath];
        header.storyChunkTitleLabel.text = chunk.title;
        return header;
    } else if (kind == UICollectionElementKindSectionFooter) {
        static NSString *footerName = @"Story Chunk Footer";
        JLStorySectionFooter *footer = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerName forIndexPath:indexPath];
        footer.storyChunkTextView.text = chunk.text;
        return footer;
    }
    
    NSLog(@"Did not return a reusable view");
    return nil;
}

- (IBAction)exitAction:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"¿Deseas regresar al menú?"
        message:@""
        delegate:self
        cancelButtonTitle:@"Cancelar"
        otherButtonTitles:@"Sí", nil];
    [alertView show];
}

- (void)   alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) {
        [JLCharacter reset];
        [JLArchetype reset];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
