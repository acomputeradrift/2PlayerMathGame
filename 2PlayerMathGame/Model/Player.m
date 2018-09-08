//
//  Player.m
//  2PlayerMathGame
//
//  Created by Jamie on 2018-08-06.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithIndex : (int)index
{
    self = [super init];
    if (self) {
        
        NSString *playerString = @"Player";
        NSString *playerNumberString = [playerString stringByAppendingString:[NSString stringWithFormat:@"%d", index]];
        _name = playerNumberString;
        _lives =3;
    }
    return self;
}

@end
