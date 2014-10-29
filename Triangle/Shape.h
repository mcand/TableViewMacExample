//
//  Shape.h
//  Triangle
//
//  Created by Andre Furquin on 10/28/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject

-(void)printArea;
-(void)calculateArea:(Shape *)form;

@property(nonatomic, assign) CGFloat area;
@property(nonatomic,strong) NSString *name;
@end
