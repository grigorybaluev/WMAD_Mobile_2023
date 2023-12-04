#import "AdditionQuestion.h"
#import "SubtractionQuestion.h"
#import "MultiplicationQuestion.h"
#import "DivisionQuestion.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSInteger score = 0;
    NSInteger scoreWrong = 0;
    BOOL isGameRunning = YES;
    CGFloat procentage = 0.0;
    
    while (isGameRunning) {
      // Generate a random question type
      NSInteger questionType = arc4random_uniform(4);
      
      Question *question;
      
      switch (questionType) {
        case 0:
          question = [[AdditionQuestion alloc] init];
          break;
        case 1:
          question = [[SubtractionQuestion alloc] init];
          break;
        case 2:
          question = [[MultiplicationQuestion alloc] init];
          break;
        case 3:
          question = [[DivisionQuestion alloc] init];
          break;
        default:
          break;
      }
      
      NSLog(@"What is %@ Enter your answer: ", question.question);
      
      char userInput[255];
      fgets(userInput, 255, stdin);
      NSString *userAnswerString = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
      NSInteger userAnswer = [userAnswerString integerValue];
      
      if (userAnswer == question.answer) {
        NSLog(@"Right!");
        score++;
      } else {
        NSLog(@"Wrong! The correct answer is %ld.", (long)question.answer);
        scoreWrong++;
      }
      
      procentage = (CGFloat)score / (score + scoreWrong) * 100.0;
      NSLog(@"Your score: %ld right, %ld wrong ---- %ld%%", (long)score, (long)scoreWrong, (long)procentage);
      
      NSTimeInterval timeTaken = [question timeToAnswer];
      NSLog(@"Time taken: %.2f seconds", timeTaken);
      
      printf("Do you want to play again? (yes/no): ");
      
      fgets(userInput, 255, stdin);
      NSString *playAgain = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
      
      if ([playAgain.lowercaseString isEqualToString:@"no\n"]) {
        isGameRunning = NO;
      }
    }
  }
  return 0;
}
