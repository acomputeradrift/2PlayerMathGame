//
//  GameModel.h
//  2PlayerMathGame
//
//  Created by Jamie on 2018-08-06.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@class Question;
@interface GameModel : NSObject
@property (nonatomic, strong)NSMutableArray <Player*> *players;
@property int whosTurn;
@property Player *currentPlayer;
@property (nonatomic, strong) Question *question;
@property (nonatomic) BOOL answer;

- (void) createPlayer : (int)playerNumber;

- (NSString*) getQuestionString;
- (void) checkAnswerAgainstInput : (int)input;
-(void)nextTurn;
@end
