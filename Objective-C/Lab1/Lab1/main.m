#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    while (1) {
      printf("Menu:\n");
      printf("1. Uppercase\n");
      printf("2. Lowercase\n");
      printf("3. Numberize\n");
      printf("4. Canadianize\n");
      printf("5. Respond\n");
      printf("6. De-Space-It\n");
      printf("7. Word Count\n");
      printf("8. Remove Punctuation\n");
      printf("9. Quit\n");
      printf("Enter your choice: ");
      
      char inputChars[255];
      fgets(inputChars, 255, stdin);
      NSString *inputString = [NSString stringWithUTF8String:inputChars];
      inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
      NSInteger choice = [inputString integerValue];
      
      switch (choice) {
        case 1: {
          printf("Input a string: ");
          fgets(inputChars, 255, stdin);
          NSString *userInput = [NSString stringWithUTF8String:inputChars];
          NSString *uppercaseString = [userInput uppercaseString];
          NSLog(@"Uppercase: %@", uppercaseString);
          break;
        }
        case 2: {
          printf("Input a string: ");
          fgets(inputChars, 255, stdin);
          NSString *userInput = [NSString stringWithUTF8String:inputChars];
          NSString *lowercaseString = [userInput lowercaseString];
          NSLog(@"Lowercase: %@", lowercaseString);
          break;
        }
        case 3: {
          printf("Input a string: ");
          fgets(inputChars, 255, stdin);
          NSString *userInput = [NSString stringWithUTF8String:inputChars];
          
          // Remove the newline character from the input
          userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
          
          NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
          NSNumber *number = [formatter numberFromString:userInput];
          
          if (number != nil) {
            NSLog(@"Numberize: %@", number);
          } else {
            NSLog(@"Invalid input for number conversion.");
          }
          break;
        }
        case 4: {
          printf("Input a string: ");
          fgets(inputChars, 255, stdin);
          NSString *userInput = [NSString stringWithUTF8String:inputChars];
          
          // Remove the newline character from the input
          userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
          
          NSString *canadianizedString = [userInput stringByAppendingString:@", eh?"];
          NSLog(@"Canadianize: %@", canadianizedString);
          break;
        }
        case 5: {
          printf("Input a string: ");
          fgets(inputChars, 255, stdin);
          NSString *userInput = [NSString stringWithUTF8String:inputChars];
          // Remove the newline character from the input
          userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
          if ([userInput hasSuffix:@"?"]) {
            NSLog(@"I don't know");
          } else if ([userInput hasSuffix:@"!"]) {
            NSLog(@"Whoa, calm down!");
          } else {
            NSLog(@"No special response.");
          }
          break;
        }
        case 6: {
          printf("Input a string: ");
          fgets(inputChars, 255, stdin);
          NSString *userInput = [NSString stringWithUTF8String:inputChars];
          NSString *deSpacedString = [userInput stringByReplacingOccurrencesOfString:@" " withString:@"-"];
          NSLog(@"De-Space-It: %@", deSpacedString);
          break;
        }
        case 7: {
          printf("Input a string: ");
          fgets(inputChars, 255, stdin);
          NSString *userInput = [NSString stringWithUTF8String:inputChars];
          userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
          
          NSArray *words = [userInput componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
          NSInteger wordCount = [words count];
          NSLog(@"Word Count: %ld", (long)wordCount);
          break;
        }
        case 8: {
          printf("Input a string: ");
          fgets(inputChars, 255, stdin);
          NSString *userInput = [NSString stringWithUTF8String:inputChars];
          userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
          
          NSCharacterSet *punctuationSet = [NSCharacterSet punctuationCharacterSet];
          NSMutableString *strippedString = [[userInput componentsSeparatedByCharactersInSet:punctuationSet] componentsJoinedByString:@""];
          NSLog(@"Remove Punctuation: %@", strippedString);
          break;
        }
        case 9: {
          NSLog(@"Goodbye!");
          return 0;
        }
        default:
          NSLog(@"Invalid choice. Please enter a valid option.");
      }
    }
  }
  return 0;
}
