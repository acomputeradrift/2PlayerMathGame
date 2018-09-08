//
//  GameModel.h
//  2PlayerMathGame
//
//  Created by Jamie on 2018-08-06.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Question;
@interface GameModel : NSObject
@property (nonatomic, strong)NSMutableArray *players;
@property int whosTurn;
@property (nonatomic, strong) Question *question;

- (void) createPlayer : (int)playerNumber;

- (NSString*) getQuestionString;
- (void) checkAnswerAgainstInput : (int)input;
-(void)nextTurn;
@end
