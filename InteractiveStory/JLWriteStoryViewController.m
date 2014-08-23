//
//  JLWriteStoryViewController.m
//  InteractiveStory
//
//  Created by Johnny Lee on 11/26/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import "JLWriteStoryViewController.h"

#import "JLStoryChunk.h"

@interface JLWriteStoryViewController ()

@property (nonatomic) NSUInteger currentStoryChunk;

@property (weak, nonatomic) IBOutlet UITextView *storyChunkTextView;
- (IBAction)nextAction:(id)sender;


@end

@implementation JLWriteStoryViewController

#pragma mark - View controller

- (void)viewDidLoad
{
    [super viewDidLoad];
    JLStoryChunk *chunk = [JLStoryChunk storyChunks][self.currentStoryChunk];
    self.navigationItem.title = chunk.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier
                                  sender:(id)sender
{
    if ([identifier isEqualToString:@"Write More Story"]) {
        if (self.currentStoryChunk + 1 == [[JLStoryChunk storyChunks] count]) {
            return NO;
        } else {
            return YES;
        }
    } else {
        return YES;
    }
}


- (IBAction)nextAction:(id)sender
{
    JLStoryChunk *chunk = [JLStoryChunk storyChunks][self.currentStoryChunk];
    chunk.text = self.storyChunkTextView.text;
    if (self.currentStoryChunk + 1 == [[JLStoryChunk storyChunks] count]) {
        [self performSegueWithIdentifier:@"Read Story" sender:self];
    } else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        JLWriteStoryViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"WriteStoryChunkVC"];
        viewController.currentStoryChunk = self.currentStoryChunk + 1;
        [self.navigationController pushViewController:viewController animated:YES];
    }
}
@end
