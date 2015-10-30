//
//  TestViewController.m
//  Lecture3HomeWork
//
//  Created by Yevhen Herasymenko on 21/10/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface TestViewController : XCTestCase

@property (strong, nonatomic) ViewController *viewController;

@end

@implementation TestViewController

- (void)setUp {
    [super setUp];
    self.viewController = [[ViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEvenTheLast {
    
    NSNumber *num1 = [self.viewController evenTheLast:@[@0, @1, @2, @3, @4, @5]];
    NSNumber *num2 = [self.viewController evenTheLast:@[@1, @3, @5]];
    NSNumber *num3 = [self.viewController evenTheLast:@[@6]];
    NSNumber *num4 = [self.viewController evenTheLast:@[]];
    XCTAssertEqualObjects(@30, num1, @"evenTheLast ошибка [0, 1, 2, 3, 4, 5]");
    XCTAssertEqualObjects(@30, num2, @"evenTheLast ошибка [1, 3, 5]");
    XCTAssertEqualObjects(@36, num3, @"evenTheLast ошибка [6]");
    XCTAssertEqualObjects(@0, num4, @"evenTheLast ошибка []");
}

- (void)testIndexPower {
    NSNumber *num1 = [self.viewController indexPower:@[@0, @1, @2, @3, @4] index:3];
    NSNumber *num2 = [self.viewController indexPower:@[@1, @3, @10, @100] index:3];
    NSNumber *num3 = [self.viewController indexPower:@[@0, @1] index:0];
    NSNumber *num4 = [self.viewController indexPower:@[@1, @2] index:3];
    XCTAssertEqualObjects(@27, num1, @"indexPower ошибка @[@0, @1, @2, @3, @4] index:2");
    XCTAssertEqualObjects(@1000000, num2, @"indexPower ошибка @[@1, @3, @10, @100] index:3");
    XCTAssertEqualObjects(@1, num3, @"indexPower ошибка @[@0, @1] index:0");
    XCTAssertEqualObjects(@(-1), num4, @"indexPower ошибка @[@1, @2] index:3");
}

- (void)testCountInversion {
    NSNumber *num1 = [self.viewController countInversion:@[@1, @2, @5, @3, @4, @7, @6]];
    NSNumber *num2 = [self.viewController countInversion:@[@0, @1, @2, @3]];
    XCTAssertEqualObjects(@3, num1, @"indexPower ошибка @[@0, @1, @2, @3, @4]");
    XCTAssertEqualObjects(@0, num2, @"indexPower ошибка @[@1, @3, @10, @100]");
}

- (void)testMedian {
    NSNumber *num1 = [self.viewController median:@[@1, @2, @3, @4, @5]];
    NSNumber *num2 = [self.viewController median:@[@3, @1, @2, @5, @3]];
    NSNumber *num3 = [self.viewController median:@[@1, @300, @2, @200, @1]];
    NSNumber *num4 = [self.viewController median:@[@3, @6, @20, @99, @10, @15]];
    XCTAssertEqualObjects(@3, num1, @"median ошибка @[@0, @1, @2, @3, @4]");
    XCTAssertEqualObjects(@3, num2, @"median ошибка @[@1, @3, @10, @100]");
    XCTAssertEqualObjects(@2, num3, @"median ошибка @[@0, @1]");
    XCTAssertEqualObjects(@12.5, num4, @"median ошибка @[@1, @2]");
}

- (void)testNonUniqueElements {
    NSArray *array1 = [self.viewController nonUniqueElements:@[@1, @2, @3, @1, @3]];
    NSArray *checkArray1 = @[@1, @3, @1, @3];
    NSArray *array2 = [self.viewController nonUniqueElements:@[@1, @2, @3, @4, @5]];
    NSArray *checkArray2 = [[NSArray alloc] init];
    NSArray *array3 = [self.viewController nonUniqueElements:@[@5, @5, @5, @5, @5]];
    NSArray *checkArray3 = @[@5, @5, @5, @5, @5];
    NSArray *array4 = [self.viewController nonUniqueElements:@[@10, @9, @10, @10,  @9, @8]];
    NSArray *checkArray4 = @[@10, @9, @10, @10, @9];
    XCTAssertEqualObjects(checkArray1, array1, @"NonUniqueElements ошибка @[@1, @2, @3, @1, @3]");
    XCTAssertEqualObjects(checkArray2, array2, @"NonUniqueElements ошибка @[@1, @2, @3, @4, @5]");
    XCTAssertEqualObjects(checkArray3, array3, @"NonUniqueElements ошибка @[@5, @5, @5, @5, @5]");
    XCTAssertEqualObjects(checkArray4, array4, @"NonUniqueElements ошибка @[@10, @9, @10, @10,  @9, @8]");
}

@end
