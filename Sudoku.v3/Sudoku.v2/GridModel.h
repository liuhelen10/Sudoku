//
//  GridModel.h
//  Sudoku.v3
//
//  Created by Helen L on 9/19/13.
//  Copyright (c) 2013 Helen Liu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GridModel : NSObject

- (int) getValueAtIndex:(int)index;
- (void) setValueAtIndex:(int)index to:(int)value;
- (int) getInitialIndexAtIndex:(int)index;

@end
