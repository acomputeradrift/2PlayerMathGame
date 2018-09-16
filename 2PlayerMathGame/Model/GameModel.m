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
    if (self.whosTurn == 0){
        self.whosTurn = 1;
    }else{
        self.whosTurn = 0;
    }
}

- (NSString*) getQuestionString{
    Player *currentPlayer = self.players [self.whosTurn];
    //Question *currentQuestion = [[Question alloc] init];
    return [NSString stringWithFormat:@"%@ : %@",currentPlayer.name, self.question.question];
}

- (NSString*) checkAnswerAgainstInput : (int)input{
    self.answer = [self.question checkIfAnswerIsCorrect:input];
    self.currentPlayer = self.players [self.whosTurn];
    if (self.answer == YES){
        if (self.currentPlayer.lives < 3) {
            self.currentPlayer.lives ++;
        }
        return @"Correct!";
    }else{
        //NSLog(@"the answer: %@ does not match the input :%@", self.answer)
        if (self.currentPlayer.lives > 1){
            self.currentPlayer.lives --;
            return @"Wrong!";
        }else{
            return @"Game over, you lose!";
        }
    }
}

@end
