//
//  JLCharacter.m
//  InteractiveStory
//
//  Created by Johnny Lee on 11/24/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import "JLCharacter.h"

@implementation JLCharacter

static NSMutableArray *availableCharacters = nil;

+ (void)reset
{
    availableCharacters = nil;
}

+ (NSMutableArray *)availableCharacters
{
    if (!availableCharacters) {
        NSArray *initialCharacters = @[
                                       [[JLCharacter alloc] initWithName:@"Alicia" filename:@"Alicia.png"],
                                       [[JLCharacter alloc] initWithName:@"Bella Durmiente" filename:@"BellaDurmiente.jpg"],
                                       [[JLCharacter alloc] initWithName:@"Caperucita Roja" filename:@"CaperuRoja.png"],
                                       [[JLCharacter alloc] initWithName:@"Don Quijote" filename:@"Don Quijote.png"],
                                       [[JLCharacter alloc] initWithName:@"Drácula" filename:@"Dracula.jpg"],
                                       [[JLCharacter alloc] initWithName:@"Frankenstein" filename:@"Frankenstein.jpg"],
                                       [[JLCharacter alloc] initWithName:@"Gato con Botas" filename:@"GatoBotas.jpg"],
                                       [[JLCharacter alloc] initWithName:@"Genio" filename:@"Genio.jpg"],
                                       [[JLCharacter alloc] initWithName:@"Hada Madrina" filename:@"HadaMadrina.png"],
                                       [[JLCharacter alloc] initWithName:@"Jorobado" filename:@"Jorobado.jpg"],
                                       [[JLCharacter alloc] initWithName:@"Malefica" filename:@"Malefica.jpg"],
                                       [[JLCharacter alloc] initWithName:@"Merlín" filename:@"Merlin.png"],
                                       [[JLCharacter alloc] initWithName:@"Patito Feo" filename:@"PatitoFeo.png"],
                                       [[JLCharacter alloc] initWithName:@"Principito" filename:@"Principito.jpg"],
                                       [[JLCharacter alloc] initWithName:@"Sirenita" filename:@"Sirenita.jpg"]
                                       ];
        availableCharacters = [[NSMutableArray alloc] initWithArray:initialCharacters];
    }
    
    NSArray *sorted = [availableCharacters sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        JLCharacter *character1 = obj1;
        JLCharacter *character2 = obj2;
        return [character1.name compare:character2.name];
    }];

    availableCharacters = [sorted mutableCopy];
    return availableCharacters;
}


- (id)initWithName:(NSString *)name filename:(NSString *)filename
{
    self = [super init];
    if (self) {
        self.name = name;
        self.filename = filename;
    }
    
    return self;
}

@end
