//
//  GameModel.m
//  2PlayerMathGame
//
//  Created by Jamie on 2018-08-06.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "GameModel.h"
#import "Player.h"
#import "Question.h"


@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [[NSMutableArray alloc] init];
        [self createPlayer:2];
        _question = [[Question alloc] init];
    
    }
    return self;
}

- (void)createPlayer:(int)playerNumber{
    
    for (int count=1; count <= playerNumber; count++) {
        Player *thisPlayer = [[Player alloc] initWithIndex:count];
        [self.players addObject:thisPlayer];
    }
    
}

-(void)nextTurn{
    if (self.whosTurn == 0)
        self.whosTurn = 1;
    else
        self.whosTurn = 0;
    _question = [[Question alloc] init];
}

- (NSString*) getQuestionString{
    Player *currentPlayer = self.players [self.whosTurn];
    return [NSString stringWithFormat:@"%@ : %@",currentPlayer.name, self.question.question];
}

- (void) checkAnswerAgainstInput : (int)input{
    // pass to question for bool return
   
    //get current user
    Player *currentPlayer = self.players [self.whosTurn];
    if (self.question.answer == input){
            currentPlayer.lives ++;
        
        }else{
            currentPlayer.lives --;
        }
    
    //if true udate score
    //else update lives
    //next turn
    
}

@end
