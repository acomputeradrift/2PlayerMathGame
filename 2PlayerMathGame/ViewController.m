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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GameModel *gameModel = [[GameModel alloc] init];
    self.questionLabel.text = [gameModel getQuestionString];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
