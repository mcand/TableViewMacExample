//
//  Shape.m
//  Triangle
//
//  Created by Andre Furquin on 10/28/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import "Shape.h"

@implementation Shape

@synthesize area, name;

-(void)printArea {
    NSLog(@"The area is %f", self.area);
}

-(void)calculateArea:(Shape *)form{
}

@end
