//
//  Triangle.m
//  Triangle
//
//  Created by Andre Furquin on 10/28/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle
@synthesize sideA, sideB, sideC, triangleClassification;

-(Triangle *)initWithSides:(CGFloat)first side:(CGFloat)second andSide:(CGFloat)third{
    self = [super init];
    if (self) {
        [self setName:@"Triangle"];
        // se a inicialização foi bem sucedida
        [self setSideA:first];
        [self setSideB:second];
        [self setSideC:third];
        
        // Calcula a area do triangulo
        [self calculateArea:self];
        
        [self setTriangleType:self];
        
    }
    return self;
}

-(BOOL)isValidTriangle:(Triangle *)triangle{
    if ((triangle.sideA > fabs(triangle.sideB-triangle.sideC)) && (triangle.sideA < (triangle.sideB + triangle.sideC))) {
        return YES;
    }
    return NO;
}


-(void)setTriangleType:(Triangle *)triangle{
    if ([self isValidTriangle:triangle]) {
        if ((triangle.sideA == triangle.sideB) && (triangle.sideA == triangle.sideC)) {
            [triangle setTriangleClassification:@"Equilateral Triangle"];
        } else {
            if ((triangle.sideA == triangle.sideB) || (triangle.sideA) == triangle.sideC) {
                [triangle setTriangleClassification:@"Isosceles Triangle"];
            } else{
                [triangle setTriangleClassification:@"Scalene Triangle"];
            }
        }
    } else{
        [triangle setTriangleClassification:@"Invalid Triangle"];
    }
}

-(void)calculateArea:(Shape *)form{
    Triangle *triangle = (Triangle *)form;
    if ([self isValidTriangle:triangle]) {
        // calculate semi perimeter
        CGFloat s = (triangle.sideA + triangle.sideB + triangle.sideC)/2;

        CGFloat triangleArea = sqrt(s*(s - triangle.sideA)*(s - triangle.sideB)*(s - triangle.sideC));
        
        [triangle setArea:triangleArea];

    } else{
        [triangle setArea:0];
    }
}

-(NSString *)getSidesOf:(Triangle *)triangle{
    return [NSString stringWithFormat:@"%f, %f e %f", triangle.sideA, triangle.sideB, triangle.sideC];
}


@end
