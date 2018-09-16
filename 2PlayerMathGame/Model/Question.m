//
//  Question.m
//  2PlayerMathGame
//
//  Created by Jamie on 2018-08-06.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSInteger firstNumber = arc4random_uniform(90) + 10;
        NSInteger secondNumber = arc4random_uniform(90) + 10;
        self.question = [NSString stringWithFormat:@"What is the sum of %li + %li?", (long)firstNumber, (long)secondNumber];
        self.answer = firstNumber + secondNumber;
    }
    return self;
}

- (BOOL) checkIfAnswerIsCorrect : (int)input{
    if (self.answer == input){
        return YES;
        
    }else{
        return NO;
    }
}
@end
