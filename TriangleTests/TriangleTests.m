//
//  TriangleTests.m
//  TriangleTests
//
//  Created by Andre Furquin on 10/26/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Triangle.h"

@interface TriangleTests : XCTestCase

@end

@implementation TriangleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTriangleCreation {
    // This is an example of a functional test case.
    Triangle *triangle1 = [[Triangle alloc] initWithSides:3 side:4 andSide:5];
    
    XCTAssertEqual(triangle1.area, 6, "Triangle area should be 6.");
    
    XCTAssertEqualObjects(triangle1.name, @"Triangle");
}

-(void)testScaleneTriangle{
    // This example tests a scalene example
    Triangle *scaleneTriangle = [[Triangle alloc] initWithSides:3 side:4 andSide:5];
    XCTAssertEqualObjects(scaleneTriangle.triangleClassification, @"Scalene Triangle", "This triangle is really scalene, that is, it has 3 different sides!");
}

-(void)testIsoscelesTriangle{
    // This example tests an isosceles example
    Triangle *isoscelesTriangle = [[Triangle alloc] initWithSides:20 side:20 andSide:10];
    XCTAssertEqualObjects(isoscelesTriangle.triangleClassification, @"Isosceles Triangle", "This triangle is really isosceles, that is, it has two equal sides!");
}

-(void)testEquilateralTriangle{
    // This example tests an equilateral triangle
    Triangle *equilateralTriangle = [[Triangle alloc] initWithSides:10 side:10 andSide:10];
    XCTAssertEqualObjects(equilateralTriangle.triangleClassification, @"Equilateral Triangle", "This triangle is really equilateral.");
}

-(void)testInvalidTriangle{
    // This example tests an invalid triangle
    Triangle *invalidTriangle = [[Triangle alloc] initWithSides:40 side:10 andSide:5];
    XCTAssertEqualObjects(invalidTriangle.triangleClassification, @"Invalid Triangle", "This triangle does not exist.");
    
    // Test whether an invalid triangle has no area
    XCTAssertEqual(invalidTriangle.area, 0, @"Invalid triangle has no area!");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
