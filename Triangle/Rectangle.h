//
//  Rectangle.h
//  Triangle
//
//  Created by Andre Furquin on 10/30/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import "Shape.h"

@interface Rectangle : Shape

-(Rectangle *)initWithSides:(CGFloat)first side:(CGFloat)second;

-(void)setRectangleType:(Rectangle *)rectangle;

-(NSString *)getSidesOf:(Rectangle *)rectangle;

@property(nonatomic, assign) CGFloat sideA;
@property(nonatomic, assign) CGFloat sideB;
@property(nonatomic, strong) NSString * rectangleClassification;

@end
