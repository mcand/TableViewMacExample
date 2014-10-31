//
//  Rectangle.m
//  Triangle
//
//  Created by Andre Furquin on 10/30/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle
@synthesize sideA, sideB, rectangleClassification;

-(Rectangle *)initWithSides:(CGFloat)first side:(CGFloat)second{
    self = [super init];
    if (self) {
        [self setName:@"Rectangle"];
        // se a inicialização foi bem sucedida
        [self setSideA:first];
        [self setSideB:second];
        
        // Calcula a area do triangulo
        [self calculateArea:self];
        
        [self setRectangleType:self];
        
    }
    return self;
}

-(void)setRectangleType:(Rectangle *)rectangle{
    if ([rectangle sideA] == [rectangle sideB]) {
        [rectangle setRectangleClassification:@"Square"];
    } else {
        [rectangle setRectangleClassification:@"Rectangle"];
    }
}


-(void)calculateArea:(Shape *)form{
    Rectangle *rectangle = (Rectangle *)form;
    CGFloat area = rectangle.sideA*rectangle.sideB;
    
    [self setArea:area];
}

-(NSString *)getSidesOf:(Rectangle *)rectangle{
  return [NSString stringWithFormat:@"%f e %f", [rectangle sideA], [rectangle sideB]];
}

@end
