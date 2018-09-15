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
    return [NSString stringWithFormat:@"%@ : %@",currentPlayer.name, self.question.question];
}



- (void) checkAnswerAgainstInput : (int)input{
    self.answer = [self.question checkIfAnswerIsCorrect:input];
    self.currentPlayer = self.players [self.whosTurn];
    if (self.answer == YES){
            self.currentPlayer.lives ++;
            NSLog(@"Answer is corect! GameModelClass");
            NSLog(@"%@ has %li lives. GameModelClass", self.currentPlayer.name, self.currentPlayer.lives);
        
        }else{
            self.currentPlayer.lives --;
            NSLog(@"Answer is NOT corect! GameModelGlass");
            NSLog(@"%@ has %li lives. GameModelClass", self.currentPlayer.name, self.currentPlayer.lives);
        }
    
    //if true udate score
    //else update lives
    //next turn
    
}

@end
