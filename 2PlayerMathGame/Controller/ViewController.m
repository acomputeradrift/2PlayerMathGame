//
//  ViewController.m
//  2PlayerMathGame
//
//  Created by Jamie on 2018-08-06.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerUILabel;
@property (weak, nonatomic) IBOutlet UILabel *rightOrWrongUILabel;

@property (nonatomic, strong) NSMutableString *enteredAnswer;
@property (nonatomic, strong) GameModel *gameModel;
@property (nonatomic, strong) Player *currentPlayer;
@property (nonatomic) int player1Score;
@property (nonatomic) int player2Score;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNewGame];
}

- (IBAction)pressed1UIButton:(UIButton *)sender {
    self.enteredAnswer = [NSMutableString stringWithFormat:@"%@1", self.enteredAnswer];
    self.answerUILabel.text = self.enteredAnswer;
}
- (IBAction)pressed2UIButton:(UIButton *)sender {
    self.enteredAnswer = [NSMutableString stringWithFormat:@"%@2", self.enteredAnswer];
    self.answerUILabel.text = self.enteredAnswer;
}
- (IBAction)pressed3UIButton:(UIButton *)sender {
    self.enteredAnswer = [NSMutableString stringWithFormat:@"%@3", self.enteredAnswer];
    self.answerUILabel.text = self.enteredAnswer;
}
- (IBAction)pressed4UIButton:(UIButton *)sender {
    self.enteredAnswer = [NSMutableString stringWithFormat:@"%@4", self.enteredAnswer];
    self.answerUILabel.text = self.enteredAnswer;
}
- (IBAction)pressed5UIButton:(UIButton *)sender {
    self.enteredAnswer = [NSMutableString stringWithFormat:@"%@5", self.enteredAnswer];
    self.answerUILabel.text = self.enteredAnswer;
}
- (IBAction)pressed6UIButton:(UIButton *)sender {
    self.enteredAnswer = [NSMutableString stringWithFormat:@"%@6", self.enteredAnswer];
    self.answerUILabel.text = self.enteredAnswer;
}
- (IBAction)pressed7UIButton:(UIButton *)sender {
    self.enteredAnswer = [NSMutableString stringWithFormat:@"%@7", self.enteredAnswer];
    self.answerUILabel.text = self.enteredAnswer;
}
- (IBAction)pressed8UIButton:(UIButton *)sender {
    self.enteredAnswer = [NSMutableString stringWithFormat:@"%@8", self.enteredAnswer];
    self.answerUILabel.text = self.enteredAnswer;
}
- (IBAction)pressed9UIButton:(UIButton *)sender {
    self.enteredAnswer = [NSMutableString stringWithFormat:@"%@9", self.enteredAnswer];
    self.answerUILabel.text = self.enteredAnswer;
}
- (IBAction)pressed0UIButton:(UIButton *)sender {
    self.enteredAnswer = [NSMutableString stringWithFormat:@"%@0", self.enteredAnswer];
    self.answerUILabel.text = self.enteredAnswer;
}

- (IBAction)pressEnterUIButton:(UIButton *)sender {
    
    //show answer feedback
    self.rightOrWrongUILabel.alpha = 1;
    self.rightOrWrongUILabel.text = [self.gameModel checkAnswerAgainstInput:[self.enteredAnswer integerValue]];
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear  animations:^{
        self.rightOrWrongUILabel.alpha = 0;
    } completion:^(BOOL finished) {
    }];
    
    //quit if lives are 0
    if ([self.rightOrWrongUILabel.text isEqualToString: @"Game over, you lose!"]) {
        [self setUpNewGame];
    }else{
        
        //update scores
        self.player1ScoreLabel.text = [NSString stringWithFormat:@"Player 1: %li",(long)self.gameModel.players[0].lives];
        self.player2ScoreLabel.text = [NSString stringWithFormat:@"Player 2: %li",(long)self.gameModel.players[1].lives];
        
        //call and update whos turn highlighting
        [self.gameModel nextTurn];
        if (self.gameModel.whosTurn == 0) {
            self.player1ScoreLabel.backgroundColor = [UIColor yellowColor];
            self.player2ScoreLabel.backgroundColor = [UIColor whiteColor];
        }else{
            self.player1ScoreLabel.backgroundColor = [UIColor whiteColor];
            self.player2ScoreLabel.backgroundColor = [UIColor yellowColor];
        }
        
        //setup and get next question
        self.questionLabel.text = [self.gameModel getQuestionString];
        self.enteredAnswer = [NSMutableString stringWithFormat:@""];
        self.answerUILabel.text = @"";
    }
}

- (void)setUpNewGame {
    //setup initial screen
    self.player1ScoreLabel.backgroundColor = [UIColor yellowColor];
    self.rightOrWrongUILabel.text = @"";
    
    //setup gameModel
    self.gameModel = [[GameModel alloc] init];
    self.gameModel.whosTurn = 0;
    
    //setup initial question
    self.questionLabel.text = [self.gameModel getQuestionString];
    self.enteredAnswer = [NSMutableString stringWithFormat:@""];
    
    //setup players
    self.player1ScoreLabel.text = [NSString stringWithFormat:@"Player 1: %li",(long)self.gameModel.players[0].lives];
    self.player2ScoreLabel.text = [NSString stringWithFormat:@"Player 2: %li",(long)self.gameModel.players[1].lives];
}
@end
