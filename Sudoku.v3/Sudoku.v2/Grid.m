//
//  Grid.m
//  Sudoku.v3
//
//  Created by Helen L on 9/13/13.
//  Copyright (c) 2013 Helen Liu. All rights reserved.
//

#import "Grid.h"
// #import "HLViewController.h"

@implementation Grid
{
    UIButton* selectedButton;
}

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // initialization code
        self.backgroundColor = [UIColor blackColor];
    }
    
    [self positionButtons];
    
    return self;
}

- (void) positionButtons
{
    // create and position buttons
    for (int i = 0; i < 81; i++) {
        UIButton *aButton;
        
        // create frame for button and position
        int size = self.bounds.size.width *.075;
        
        int originX;
        int originY;
        
        if (i % 3 == 0) {
            originX = self.bounds.size.width * .08 + (i % 9) * (size + self.bounds.size.width * .024);
            if (i % 81 < 27) {
                originY = self.bounds.size.height * .08 + (i / 9) * (size + self.bounds.size.height * .012);
            } else if (i % 81 < 54) {
                originY = (self.bounds.size.height * .036) + self.bounds.size.height * .08 + (i / 9) * (size + self.bounds.size.height * .012);
            } else {
                 originY = (self.bounds.size.height * .072) + self.bounds.size.height * .08 + (i / 9) * (size + self.bounds.size.height * .012);
            }
            
        } else {
            if (i % 9 < 4) {
                originX = self.bounds.size.width * .08 + (i % 9) * (size + self.bounds.size.width * .012);
            } else if (i % 9 < 6) {
                originX = (self.bounds.size.width * .036) + self.bounds.size.width * .08 + (i % 9) * (size + self.bounds.size.width * .012);
            } else {
                originX = (self.bounds.size.width * .072) + self.bounds.size.width * .08 + (i % 9) * (size + self.bounds.size.width * .012);
            }
            
            if (i % 81 < 27) {
                originY = self.bounds.size.height * .08 + (i / 9) * (size + self.bounds.size.height * .012);
            } else if (i % 81 < 54) {
                originY = (self.bounds.size.height * .036) + self.bounds.size.height * .08 + (i / 9) * (size + self.bounds.size.height * .012);
            } else {
                originY = (self.bounds.size.height * .072) + self.bounds.size.height * .08 + (i / 9) * (size + self.bounds.size.height * .012);
            }
        }
        
        CGRect buttonFrame = CGRectMake(originX, originY, size, size);
        
        // create the button and add as a subview
        aButton = [[UIButton alloc] initWithFrame: buttonFrame];
        aButton.backgroundColor = [UIColor whiteColor];
        [aButton setTag:i];
        [aButton addTarget:nil action:@selector(gridButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:aButton];
        [self.buttons addObject:aButton];
    }
}

- (NSMutableArray*) buttons
{
    if (!_buttons) {
        _buttons = [[NSMutableArray alloc] init];
    }
    
    return _buttons;
}

- (void) setValueAtIndex:(int)index to:(int)value
{
    // sets initially generated values
    UIButton* aButton = [self.buttons objectAtIndex: index];
    if (value != 0) {
        [aButton setTitle:[NSString stringWithFormat:@"%d", value] forState:UIControlStateNormal];
        [aButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

- (void) setNewValueAtIndex:(int)index to:(int)value
{
    // sets user-entered values
    UIButton* aButton = [self.buttons objectAtIndex: index];
    if (value != 0 && value !=10) {
        [aButton setTitle:[NSString stringWithFormat:@"%d", value] forState:UIControlStateNormal];
        [aButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    } else {
        [aButton setTitle:nil forState:UIControlStateNormal];
    }
}

- (UIButton*) getSelectedButton
{
    return selectedButton;
}

@end

