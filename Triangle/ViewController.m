//
//  ViewController.m
//  Triangle
//
//  Created by Andre Furquin on 10/26/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController
@synthesize shoppingListArray, tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    Triangle *scaleneTriangle = [[Triangle alloc] initWithSides:3 side:4 andSide:5];
    Triangle *isoscelesTriangle = [[Triangle alloc] initWithSides:20 side:20 andSide:10];
    Triangle *equilateralTriangle = [[Triangle alloc] initWithSides:10 side:10 andSide:10];
    Triangle *invalidTriangle = [[Triangle alloc] initWithSides:40 side:10 andSide:5];
    
    
    self.shoppingListArray = [[NSMutableArray alloc] initWithObjects:scaleneTriangle, isoscelesTriangle, equilateralTriangle, invalidTriangle, nil];

    [tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    NSLog(@"%lu", self.shoppingListArray.count);
    return [self.shoppingListArray count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSTableCellView *result = [self.tableView makeViewWithIdentifier:@"MyView" owner:self];
    
    Triangle *triangle = [self.shoppingListArray objectAtIndex:row];
    
    if ([tableColumn.identifier isEqualToString:@"Form"]) {
        result.textField.stringValue = triangle.name;
    } else if ([tableColumn.identifier isEqualToString:@"Sides"]) {
        result.textField.stringValue = [NSString stringWithFormat:@"%.2f, %.2f e %.2f", triangle.sideA, triangle.sideB, triangle.sideC];
    } else if ([tableColumn.identifier isEqualToString:@"ValidForm"]) {
        result.textField.stringValue = [triangle isValidTriangle:triangle] ? @"Yes": @"No";
    } else if ([tableColumn.identifier isEqualToString:@"Area"]) {
        result.textField.stringValue = [NSString stringWithFormat:@"%.2f", triangle.area];
    } else if ([tableColumn.identifier isEqualToString:@"FormType"]) {
        result.textField.stringValue = [triangle triangleClassification];
    }
    
//    result.name.textField.stringValue = [self.shoppingListArray objectAtIndex:row];
    //result.textField.stringValue = triangle.name;
    return result;
    
}





@end
