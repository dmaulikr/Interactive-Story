//
//  JLStoryChunk.m
//  InteractiveStory
//
//  Created by Johnny Lee on 11/26/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import "JLStoryChunk.h"

@implementation JLStoryChunk

+ (NSArray *)storyChunks
{
    static NSArray *storyChunks = nil;
    if (!storyChunks) {
        storyChunks = @[
                        [[JLStoryChunk alloc] initWithTitle:@"Había una vez"],
                        [[JLStoryChunk alloc] initWithTitle:@"Un día"],
                        [[JLStoryChunk alloc] initWithTitle:@"Entonces"],
                        [[JLStoryChunk alloc] initWithTitle:@"Pero"],
                        [[JLStoryChunk alloc] initWithTitle:@"Ya que"],
                        [[JLStoryChunk alloc] initWithTitle:@"Finalmente"],
                        ];
    }
    
    return storyChunks;
}

- (id)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
    }
    
    return self;
}

@end
