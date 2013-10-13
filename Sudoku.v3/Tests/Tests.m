//
//  Tests.m
//  Tests
//
//  Created by Helen L on 9/20/13.
//  Copyright (c) 2013 Helen Liu. All rights reserved.
//

#import "Tests.h"

@implementation Tests

- (void) setUp
{
    [super setUp];
    
    // Set-up code here.
    testModel = [[GridModel alloc] init];
}

- (void) tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void) testSetUp
{
    STAssertNotNil(testModel, @"testSetUp");
    
    // prevents test from not finishing
    [NSThread sleepForTimeInterval: 1.0];
}

- (void) testInitialValuesNotEmpty
{
    int sum = 0;
    for (int i = 0; i < 81; i++) {
        sum = sum + [testModel getValueAtIndex:i];
        
        // prevents test from not finishing
        [NSThread sleepForTimeInterval: 0.05];
    }
    STAssertTrue(sum != 0, @"testInitialValuesNotEmpty failed");
}

- (void) testIntialValuesNotFull
{
    bool full = true;
    for (int i = 0; i < 81; i++) {
        if ([testModel getValueAtIndex:i] == 0) {
            full = false;
        }
        
        // prevents test from not finishing
        [NSThread sleepForTimeInterval: 0.05];
    }
    STAssertTrue(full != true, @"testInitialValuesNotFull failed");
}

-(void) testAtLeast17Values
{
    int sum = 0;
    for (int i = 0; i < 81; i++) {
        if ([testModel getValueAtIndex:i] != 0){
            sum = sum + 1;
        }
        
        // prevents test from not finishing
        [NSThread sleepForTimeInterval: 0.05];
    }
    STAssertTrue(sum >= 17, @"testAtLeast17Values failed");
}

- (void) testSetValues
{
    for (int i =0; i<81; i++){
        [testModel setValueAtIndex:i to:5];
        STAssertTrue([testModel getValueAtIndex:i] == 5, @"testSetValues fails");
        // prevents test from not finishing
        [NSThread sleepForTimeInterval: 0.05];
    }
}

- (void) testSetValuesInRange
{
    for (int i = 0; i<81; i++){
        [testModel setValueAtIndex:i to:10];
        STAssertFalse(0 <= [testModel getValueAtIndex:i] && [testModel getValueAtIndex:i] <= 9, @"set values out of range");
        // prevents test from not finishing
        [NSThread sleepForTimeInterval: 0.05];
    }
}

- (void) testGridValueRange
{
    for (int i=0; i<81; i++){
        int value = [testModel getValueAtIndex:i];
        STAssertTrue(0 <= value && value <= 9, @"testGridValueRange failed");
        // prevents test from not finishing
        [NSThread sleepForTimeInterval: 0.05];
    }
}

- (void) testFor81GridValues
{
    int sum = 0;
    for (int i=0; i<81; i++){
        int value = [testModel getValueAtIndex:i];
        if (0 <= value && value <= 9){
            sum = sum + 1;
        }
    }
        STAssertTrue(sum = 81, @"there are not 81 grid values");
}

- (void) testInitialValuesUnchanged
{

    for (int i =0; i<81; i++){
        int origValue = [testModel getInitialIndexAtIndex:i];
        int currentValue = [testModel getValueAtIndex:i];
        if (origValue != 0){
            origValue = 50;
            STAssertTrue(currentValue != 50, @"original values can be changed");
        }
    }
}

- (void) testInitialValuesInRange
{
    for (int i=0; i<81; i++){
        int value = [testModel getInitialIndexAtIndex:i];
        STAssertTrue(0 <= value && value <= 9, @"initial values are not in range");
    }
}

@end
