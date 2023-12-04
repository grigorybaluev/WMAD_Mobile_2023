#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    // Initialize variables for the game
    NSInteger score = 0;
    BOOL isGameRunning = YES;
    
    while (isGameRunning) {
      // Generate two random numbers between 1 and 100 for the addition question
      NSInteger num1 = arc4random_uniform(100) + 1;
      NSInteger num2 = arc4random_uniform(100) + 1;
      
      // Calculate the correct answer
      NSInteger correctAnswer = num1 + num2;
      
      // Ask the user the question
      printf("What is %ld + %ld? Enter your answer: ", (long)num1, (long)num2);
      
      // Get user input as a C string
      char userInput[255];
      fgets(userInput, 255, stdin);
      
      // Convert C string to an NSString
      NSString *userAnswerString = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
      
      // Convert user's answer to an NSInteger
      NSInteger userAnswer = [userAnswerString integerValue];
      
      // Check if the user's answer is correct
      if (userAnswer == correctAnswer) {
        NSLog(@"Right!");
        score++;
      } else {
        NSLog(@"Wrong! The correct answer is %ld.", (long)correctAnswer);
      }
      
      // Display the current score
      NSLog(@"Your score: %ld", (long)score);
      
      // Ask if the user wants to continue playing
      printf("Do you want to play again? (yes/no): ");
      
      // Get user's choice to continue or exit
      fgets(userInput, 255, stdin);
      NSString *playAgain = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
      
      // Check if the user wants to exit
      if ([playAgain.lowercaseString isEqualToString:@"no\n"]) {
        isGameRunning = NO;
      }
    }
  }
  return 0;
}
