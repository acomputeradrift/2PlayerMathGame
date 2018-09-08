//
//  Player.h
//  2PlayerMathGame
//
//  Created by Jamie on 2018-08-06.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, assign) NSInteger lives;
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithIndex : (int)index;

@end
