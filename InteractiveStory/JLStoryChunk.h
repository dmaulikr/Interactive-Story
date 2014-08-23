//
//  JLStoryChunk.h
//  InteractiveStory
//
//  Created by Johnny Lee on 11/26/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLStoryChunk : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *text;

+ (NSArray *)storyChunks;

- (id)initWithTitle:(NSString *)title;

@end
