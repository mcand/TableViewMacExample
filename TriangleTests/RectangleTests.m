//
//  RectangleTests.m
//  Triangle
//
//  Created by Andre Furquin on 10/31/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Rectangle.h"

@interface RectangleTests : XCTestCase

@end

@implementation RectangleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRectangleCreation {
    // This is an example of a functional test case.
    Rectangle *rectangle = [[Rectangle alloc] initWithSides:4 side:5];
    
    XCTAssertEqual(rectangle.area, 20, "Rectangle area should be 20.");
    
    XCTAssertEqualObjects(rectangle.name, @"Rectangle");
}

-(void)testSquareRectangle {
    Rectangle *square = [[Rectangle alloc] initWithSides:4 side:4];

    XCTAssertEqualObjects(square.rectangleClassification, @"Square", "This rectangle has a pair of equal sides!");
}

-(void)testAnonSquare {
    Rectangle *rectangle = [[Rectangle alloc] initWithSides:4 side:5];

    XCTAssertEqualObjects(rectangle.rectangleClassification, @"Rectangle", "This is not a square!");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
