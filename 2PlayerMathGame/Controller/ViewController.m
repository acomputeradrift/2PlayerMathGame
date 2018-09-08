//
//  ViewController.m
//  2PlayerMathGame
//
//  Created by Jamie on 2018-08-06.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2ScoreLabel;
@property (nonatomic, strong) NSMutableString *answer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.player1ScoreLabel.backgroundColor = [UIColor yellowColor];
    
    GameModel *gameModel = [[GameModel alloc] init];
    gameModel.whosTurn = 0;
    self.questionLabel.text = [gameModel getQuestionString];
    //self.answer = [gameModel getAnswer];

}
- (IBAction)pressEnterUIButton:(UIButton *)sender {
    GameModel *gameModel = [[GameModel alloc] init];
    [gameModel checkAnswerAgainstInput:[self.answer integerValue]];
    [gameModel nextTurn];
    if (gameModel.whosTurn == 0) {
        self.player1ScoreLabel.backgroundColor = [UIColor yellowColor];
    }else{
        self.player1ScoreLabel.backgroundColor = [UIColor whiteColor];
        self.player2ScoreLabel.backgroundColor = [UIColor yellowColor];
    }
    self.questionLabel.text = [gameModel getQuestionString];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
