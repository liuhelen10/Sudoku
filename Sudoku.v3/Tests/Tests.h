//
//  Tests.h
//  Tests
//
//  Created by Helen L on 9/20/13.
//  Copyright (c) 2013 Helen Liu. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GridModel.h"
#import "HLViewController.h"

@interface Tests : SenTestCase
{
    GridModel* testModel;
}

- (void) testSetUp;
- (void) testInitialValuesNotEmpty;
- (void) testIntialValuesNotFull;
- (void) testAtLeast17Values;
- (void) testSetValues;
- (void) testSetValuesInRange;
- (void) testGridValueRange;
- (void) testFor81GridValues;
- (void) testInitialValuesUnchanged;
- (void) testInitialValuesInRange;

@end
