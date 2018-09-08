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
@property (nonatomic, strong) GameModel *gameModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.player1ScoreLabel.backgroundColor = [UIColor yellowColor];
    
    self.gameModel = [[GameModel alloc] init];
    self.gameModel.whosTurn = 0;
    self.questionLabel.text = [self.gameModel getQuestionString];
    //self.answer = [gameModel getAnswer];

}
- (IBAction)pressEnterUIButton:(UIButton *)sender {
    NSLog(@"%i", self.gameModel.whosTurn);
    [self.gameModel checkAnswerAgainstInput:[self.answer integerValue]];
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
