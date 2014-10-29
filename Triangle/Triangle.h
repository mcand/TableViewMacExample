//
//  Triangle.h
//  Triangle
//
//  Created by Andre Furquin on 10/28/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import "Shape.h"
#import <tgmath.h>

@interface Triangle : Shape{

}

-(Triangle *)initWithSides:(CGFloat)first side:(CGFloat)second andSide:(CGFloat)third;

-(BOOL)isValidTriangle:(Triangle *)triangle;

-(void)setTriangleType:(Triangle *)triagle;

-(NSString *)getSidesOf:(Triangle *)triangle;

@property(nonatomic, assign) CGFloat sideA;
@property(nonatomic, assign) CGFloat sideB;
@property(nonatomic, assign) CGFloat sideC;
@property(nonatomic, strong) NSString * triangleClassification;


@end
