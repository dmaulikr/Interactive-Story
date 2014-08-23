//
//  JLArchetype.h
//  InteractiveStory
//
//  Created by Johnny Lee on 11/24/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JLCharacter.h"

@interface JLArchetype : NSObject

@property (nonatomic) NSUInteger characterCount;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *characters;
@property (strong, nonatomic) NSString *description;

- (id)initWithCount:(NSUInteger)count
               name:(NSString *)name
        description:(NSString *)description;

+ (void)reset;

+ (NSArray *)allArchetypes;

@end
