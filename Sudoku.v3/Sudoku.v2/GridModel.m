//
//  GridModel.m
//  Sudoku.v3
//
//  Created by Helen L on 9/19/13.
//  Copyright (c) 2013 Helen Liu. All rights reserved.
//

#import "GridModel.h"

@implementation GridModel
{
    int gridValues[81];
    int initialIndexes[81];
}

- (id) init
{
    // parse text file to generate initialValues
    NSString* path = [[NSBundle mainBundle] pathForResource:@"grids1" ofType:@"txt"];
    NSError* error;
    
    int random = arc4random_uniform(30001);
    
    NSString* fileContents = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    NSArray* lines = [fileContents componentsSeparatedByString:@"\n"];
    NSString* line = lines[random];
    
    NSLog(@"Read value: %@", line);
    
    
    // fills board w/initial values
    self = [super init];
    if (self) {
        int tempInitialValues[81];
        for (int i = 0; i < 81; i++) {
            if ([line characterAtIndex:i] == '.') {
                tempInitialValues[i] = 0;
            } else {
                char character = [line characterAtIndex:i];
                int value = character - '0';
                tempInitialValues[i] = value;
            }
        }

        for (int i = 0; i < 81; i++) {
            gridValues[i] = tempInitialValues[i];
            if (tempInitialValues[i] != 0) {
                initialIndexes[i] = 1;
            } else {
                initialIndexes[i] = 0;
            }
        }
    }

    return self;
}

- (int) getValueAtIndex:(int)index
{
    return gridValues[index];
}

- (void) setValueAtIndex:(int)index to:(int)value
{
    gridValues[index] = value;
}

- (int) getInitialIndexAtIndex:(int)index
{
    // allows you to check if number at a given index was part of the originally generated board or
    // was inputted by the user
    return initialIndexes[index];
}



@end
