//
//  JLArchetype.m
//  InteractiveStory
//
//  Created by Johnny Lee on 11/24/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import "JLArchetype.h"

static NSArray* roles = nil;

@implementation JLArchetype

#pragma mark - init

- (id)initWithCount:(NSUInteger)count
               name:(NSString *)name
        description:(NSString *)description
{
    self = [super init];
    if (self) {
        self.characterCount = count;
        self.name = name;
        self.description = description;
    }
    
    return self;
}

#pragma mark - Properties

- (NSMutableArray *)characters
{
    if (!_characters) {
        _characters = [[NSMutableArray alloc] initWithCapacity:self.characterCount];
    }
    
    return _characters;
}


#pragma mark - Archetypes

+ (void)reset
{
    roles = nil;
}

+ (NSArray *)allArchetypes
{
    if (!roles) {
        roles = @[
                  [[JLArchetype alloc] initWithCount:1
                                                name:@"Protagonista"
                                         description:@"Personaje principal de la historia."],
                  [[JLArchetype alloc] initWithCount:1
                                                name:@"Antagonista"
                                         description:@"Enemigo principal de la historia."],
                  [[JLArchetype alloc] initWithCount:1
                                                name:@"Mentor"
                                         description:@"Quien prepara al protagonista para alcanzar su meta."],
                  [[JLArchetype alloc] initWithCount:1
                                                name:@"Heraldo"
                                         description:@"Quien anuncia al protagonista algo que le hace emprender su camino."],
                  [[JLArchetype alloc] initWithCount:3
                                                name:@"Aliados"
                                         description:@"Quienes ayudan o benefician al protagnista."],
                  [[JLArchetype alloc] initWithCount:3
                                                name:@"Enemigos"
                                         description:@"Quienes se oponen al protagonista de lograr su meta."]
                  ];
    }
    return roles;
}

@end
