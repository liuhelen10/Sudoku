//
//  NumberPad.m
//  Sudoku.v3
//
//  Created by Helen L on 9/13/13.
//  Copyright (c) 2013 Helen Liu. All rights reserved.
//

#import "NumberPad.h"

@implementation NumberPad
{
    NSMutableArray* numberPadButtons;
    int* selectedNumber;
}

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
    }
    
    [self createButtons];
    
    return self;
}

- (void) createButtons
{
    // array of numpad buttons
    numberPadButtons = [[NSMutableArray alloc] initWithCapacity:10];
    
    int numberPadValues[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    
    for (int i = 0; i < 10; i++)
    {
        UIButton *aButton;
        
        // create frame for button
        int size = self.bounds.size.width * .0792;
        int originX = self.bounds.size.width * .02 + (i * (size + self.bounds.size.width * .02));
        int originY = self.bounds.size.height * .15;
        CGRect buttonFrame = CGRectMake(originX, originY, size, size);
        
        // create the button and add as a subview
        aButton = [[UIButton alloc] initWithFrame: buttonFrame];
        
        // initialize so that 0 is selected
        if (i == 0)
        {
            aButton.backgroundColor = [UIColor redColor];
            [aButton setTag: i];
            [aButton addTarget: self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:aButton];
        }
        else
        {
            aButton.backgroundColor = [UIColor whiteColor];
            [aButton setTag: i];
            [aButton addTarget: self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:aButton];
            
            [aButton setTitle:[NSString stringWithFormat:@"%d", numberPadValues[i]] forState:UIControlStateNormal];
            [aButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        }
        
        [numberPadButtons addObject:aButton];
    }
    
    selectedNumber = 0;
}

- (void) buttonPressed:(id)sender
{
    
    UIButton *buttonPressed = (UIButton*)sender;
    
    selectedNumber = buttonPressed.tag;
    
    bool buttonIsHighlighted = NO;
    
    // highlights the selected button and un-highlights the previously selected button
    for (UIButton *abutton in numberPadButtons)
    {
        if (abutton.highlighted)
        {
            buttonIsHighlighted = YES;
            [abutton setBackgroundColor:[UIColor redColor]];
        }
    }
    
    if (buttonIsHighlighted)
    {
        for (UIButton *abutton in numberPadButtons)
        {
            if (buttonPressed == abutton)
            {
                buttonIsHighlighted = YES;
                [abutton setBackgroundColor:[UIColor redColor]];
            }
            
            else
            {
                abutton.highlighted = NO;
                [abutton setBackgroundColor:[UIColor whiteColor]];
            }
        }
    }
    NSLog (@"%@/%d/%@", @"Button ", selectedNumber, @" is selected");
}

- (int) getSelectedNumber
{
    return selectedNumber;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
