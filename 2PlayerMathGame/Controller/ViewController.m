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

@property (nonatomic, strong) NSMutableString *answer;
@property (nonatomic, strong) GameModel *gameModel;
@property (nonatomic, strong) Player *currentPlayer;
@property (nonatomic) int player1Score;
@property (nonatomic) int player2Score;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //setup initial screen
    self.player1ScoreLabel.backgroundColor = [UIColor yellowColor];

    //setup gameModel
    self.gameModel = [[GameModel alloc] init];
    self.gameModel.whosTurn = 0;
    
    //setup initial question
    self.questionLabel.text = [self.gameModel getQuestionString];
     self.answer = [NSMutableString stringWithFormat:@""];
    //setup players
    
    self.player1ScoreLabel.text = [NSString stringWithFormat:@"Player 1: %li",(long)self.gameModel.players[0].lives];
    self.player2ScoreLabel.text = [NSString stringWithFormat:@"Player 2: %li",(long)self.gameModel.players[1].lives];
}

- (IBAction)pressed1UIButton:(UIButton *)sender {
    self.answer = [NSMutableString stringWithFormat:@"%@1", self.answer];
    self.answerUILabel.text = self.answer;
}
- (IBAction)pressed2UIButton:(UIButton *)sender {
    self.answer = [NSMutableString stringWithFormat:@"%@2", self.answer];
    self.answerUILabel.text = self.answer;
}
- (IBAction)pressed3UIButton:(UIButton *)sender {
    self.answer = [NSMutableString stringWithFormat:@"%@3", self.answer];
    self.answerUILabel.text = self.answer;
}
- (IBAction)pressed4UIButton:(UIButton *)sender {
    self.answer = [NSMutableString stringWithFormat:@"%@4", self.answer];
    self.answerUILabel.text = self.answer;
}
- (IBAction)pressed5UIButton:(UIButton *)sender {
    self.answer = [NSMutableString stringWithFormat:@"%@5", self.answer];
    self.answerUILabel.text = self.answer;
}
- (IBAction)pressed6UIButton:(UIButton *)sender {
    self.answer = [NSMutableString stringWithFormat:@"%@6", self.answer];
    self.answerUILabel.text = self.answer;
}
- (IBAction)pressed7UIButton:(UIButton *)sender {
    self.answer = [NSMutableString stringWithFormat:@"%@7", self.answer];
    self.answerUILabel.text = self.answer;
}
- (IBAction)pressed8UIButton:(UIButton *)sender {
    self.answer = [NSMutableString stringWithFormat:@"%@8", self.answer];
    self.answerUILabel.text = self.answer;
}
- (IBAction)pressed9UIButton:(UIButton *)sender {
    self.answer = [NSMutableString stringWithFormat:@"%@9", self.answer];
    self.answerUILabel.text = self.answer;
}
- (IBAction)pressed0UIButton:(UIButton *)sender {
    self.answer = [NSMutableString stringWithFormat:@"%@0", self.answer];
    self.answerUILabel.text = self.answer;
}

- (IBAction)pressEnterUIButton:(UIButton *)sender {
    [self.gameModel checkAnswerAgainstInput:[self.answer integerValue]];
    self.player1ScoreLabel.text = [NSString stringWithFormat:@"Player 1: %li",(long)self.gameModel.players[0].lives];
    self.player2ScoreLabel.text = [NSString stringWithFormat:@"Player 2: %li",(long)self.gameModel.players[1].lives];
    [self.gameModel nextTurn];
    if (self.gameModel.whosTurn == 0) {
        self.player1ScoreLabel.backgroundColor = [UIColor yellowColor];
        self.player2ScoreLabel.backgroundColor = [UIColor whiteColor];
    }else{
        self.player1ScoreLabel.backgroundColor = [UIColor whiteColor];
        self.player2ScoreLabel.backgroundColor = [UIColor yellowColor];
        
    }
    self.questionLabel.text = [self.gameModel getQuestionString];
    self.answer = [NSMutableString stringWithFormat:@""];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
