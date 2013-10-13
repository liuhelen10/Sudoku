//
//  HLViewController.m
//  Sudoku.v3
//
//  Created by Helen L on 9/13/13.
//  Copyright (c) 2013 Helen Liu. All rights reserved.
//


#import "HLViewController.h"

@interface HLViewController ()
{
    Grid* theGrid;
    NumberPad* theNumberPad;
    GridModel* theModel;
    
}

@end

@implementation HLViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
	// do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // create frame for grid
    int gridOriginX = self.view.bounds.size.width * .10;
    int gridOriginY = self.view.bounds.size.height * .08;
    int gridSize = MIN(self.view.bounds.size.width, self.view.bounds.size.height) * .8;
    CGRect gridFrame = CGRectMake(gridOriginX, gridOriginY, gridSize, gridSize);
    
    // create grid
    theGrid = [[Grid alloc] initWithFrame: gridFrame];
    [self.view addSubview: theGrid];
    
    // create model
    theModel = [[GridModel alloc] init];
    
    // fill values in grid
    for (int i = 0; i < 81; i++) {
        int value = [theModel getValueAtIndex:i];
        [theGrid setValueAtIndex:i to:value];
    }
    
    // create frame for number pad
    int numberPadOriginX = self.view.bounds.size.width * .10;
    int numberPadOriginY = self.view.bounds.size.height * .73;
    int numberPadWidth = self.view.bounds.size.width * .8;
    int numberPadHeight = self.view.bounds.size.height * .071;
    CGRect numberPadFrame = CGRectMake(numberPadOriginX, numberPadOriginY, numberPadWidth, numberPadHeight);
    
    // create number pad
    theNumberPad = [[NumberPad alloc] initWithFrame: numberPadFrame];
    [self.view addSubview: theNumberPad];
}

- (void) gridButtonPressed:(id) sender
{
    int selectedNumber = [theNumberPad getSelectedNumber];
    int senderTag = [sender tag];
    NSLog (@"%@/%d/%@%@", @"Button ", senderTag, @" was pressed with contents ", [sender currentTitle]);
    
    bool isConsistent = [self checkConsistencyOf:selectedNumber atIndex:senderTag];
    
    if (([theModel getInitialIndexAtIndex:senderTag] == 0) && (isConsistent == true)) {
        
        // if a number is selected and either a blank cell or a cell containing a number different from the one selected
        // is clicked, then replace the cell with the selected number.
        // else if the selected number is the same as the number currently in the clicked cell, clear the number from the cell.
        
        // if ([theModel getValueAtIndex:senderTag] != selectedNumber) {
        if (selectedNumber != 0) {
            [theModel setValueAtIndex:senderTag to:selectedNumber];
            [theGrid setNewValueAtIndex:senderTag to:selectedNumber];
        } else {
            [theModel setValueAtIndex:senderTag to:0];
            [theGrid setNewValueAtIndex:senderTag to:10];
        }
    } else if (isConsistent == false) {
        NSString* message = [NSString stringWithFormat: @"You cannot put that number here."];
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle: @"Try Again!"
                                                            message: message
                                                           delegate: nil
                                                  cancelButtonTitle: nil
                                                  otherButtonTitles: @"OK", nil];
        [alertView show];
    }
    
    [self checkFinishedGrid];

}

- (void) checkFinishedGrid
{
    // if board is full, grid is finished
    int sum = 0;
    for (int i = 0; i < 81; i++){
        if (0 < [theModel getValueAtIndex:i] && [theModel getValueAtIndex:i] <=9){
            sum = sum + 1;
        }
    }
    if (sum >= 81){
        NSString* message = [NSString stringWithFormat: @"You win."];
        UIAlertView* alertView1 = [[UIAlertView alloc] initWithTitle: @"Awesome!"
                                                             message: message
                                                            delegate: nil
                                                   cancelButtonTitle: nil
                                                   otherButtonTitles: @"OK", nil];
        [alertView1 show];
    }
    
    
}


- (bool) checkConsistencyOf:(int)selectedNumber atIndex:(int)senderTag
{
    // checks consistency of a move
    
    bool isConsistent = true;
    
    if (selectedNumber != 0 ) {

        for (int i = 0; i < 81; i++) {
        
            // check column
            if ((senderTag % 9 == i % 9) && (senderTag != i)) {
                if ([theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            }
        
            // check row
            if (senderTag >= 0 && senderTag <= 8 && senderTag != i) {
                if (i >= 0 && i <= 8 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag >= 9 && senderTag <= 17 && senderTag != i) {
                if (i >= 9 && i <= 17 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag >= 18 && senderTag <= 26 && senderTag != i) {
                if (i >= 18 && i <= 26 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag >= 27 && senderTag <= 35 && senderTag != i) {
                if (i >= 27 && i <= 35 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag >= 36 && senderTag <= 44 && senderTag != i) {
                if (i >= 36 && i <= 44 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag >= 45 && senderTag <= 53 && senderTag != i) {
                if (i >= 45 && i <= 53 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag >= 54 && senderTag <= 62 && senderTag != i) {
                if (i >= 54 && i <= 62 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag >= 63 && senderTag <= 71 && senderTag != i) {
                if (i >= 63 && i <= 71 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag >= 72 && senderTag <= 80 && senderTag !=i) {
                if (i >= 72 && i <= 80 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            }
            
            // check square
            if (senderTag < 27 && senderTag % 9 < 3 && senderTag != i) {
                if (i < 27 && i % 9 < 3 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag < 27 && senderTag % 9 < 6 && senderTag % 9 >= 3 && senderTag != i) {
                if (i < 27 && i % 9 < 6 && i % 9 >= 3 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag < 27 && senderTag % 9 < 9 && senderTag % 9 >= 6 && senderTag != i) {
                if (i < 27 && i % 9 < 9 && i % 9 >= 6 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag < 54 && senderTag >= 27 && senderTag % 9 < 3 && senderTag != i) {
                if (i < 54 && i >= 27 && i % 9 < 3 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag < 54 && senderTag >= 27 && senderTag % 9 < 6 && senderTag % 9 >= 3 && senderTag != i) {
                if (i < 54 && i >= 27 && i % 9 < 6 && i % 9 >= 3 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag < 54 && senderTag >= 27 && senderTag % 9 < 9 && senderTag % 9 >= 6 && senderTag != i) {
                if (i < 54 && i >= 27 && i % 9 < 9 && i % 9 >= 6 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag < 81 && senderTag >= 54 && senderTag % 9 < 3 && senderTag != i) {
                if (i < 81 && i >= 54 && i % 9 < 3 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag < 81 && senderTag >= 54 && senderTag % 9 < 6 && senderTag % 9 >= 3 && senderTag != i) {
                if (i < 81 && i >= 54 && i % 9 < 6 && i % 9 >= 3 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            } else if (senderTag < 81 && senderTag >= 54 && senderTag % 9 < 9 && senderTag % 9 >= 6 && senderTag != i) {
                if (i < 81 && i >= 54 && i % 9 < 9 && i % 9 >= 6 && [theModel getValueAtIndex:i] == selectedNumber) {
                    isConsistent = false;
                }
            }
        }
    }
    
    return isConsistent;
}



- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

