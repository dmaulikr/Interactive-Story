//
//  JLCharacter.h
//  InteractiveStory
//
//  Created by Johnny Lee on 11/24/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLCharacter : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *filename;


+ (void)reset;
+ (NSMutableArray *)availableCharacters;

- (id)initWithName:(NSString *)name filename:(NSString *)filename;

@end
