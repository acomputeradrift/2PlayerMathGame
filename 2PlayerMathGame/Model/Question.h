//
//  Question.h
//  2PlayerMathGame
//
//  Created by Jamie on 2018-08-06.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString* question;
@property (nonatomic) NSInteger answer;

- (BOOL) checkIfAnswerIsCorrect : (int)input;

@end
