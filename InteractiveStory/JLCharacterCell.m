//
//  JLCharacterCell.m
//  InteractiveStory
//
//  Created by Johnny Lee on 11/24/13.
//  Copyright (c) 2013 Johnny Lee. All rights reserved.
//

#import "JLCharacterCell.h"

@interface JLCharacterCell ()

@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UILabel *characterNameLabel;

@end

@implementation JLCharacterCell

- (void)setCharacter:(JLCharacter *)character
{
    _character = character;
    self.characterNameLabel.text = character.name;
    self.characterImageView.image = [UIImage imageNamed:character.filename];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        self.backgroundColor = [UIColor grayColor];
    } else {
        self.backgroundColor = [UIColor blackColor];
    }
}

@end
