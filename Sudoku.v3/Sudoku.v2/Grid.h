//
//  Grid.h
//  Sudoku.v3
//
//  Created by Helen L on 9/13/13.
//  Copyright (c) 2013 Helen Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Grid : UIView

@property (nonatomic, strong) NSMutableArray* buttons;

- (void) positionButtons;
- (void) setValueAtIndex:(int)index to:(int)value;
- (void) setNewValueAtIndex:(int)index to:(int)value;
- (UIButton*) getSelectedButton;

@end
